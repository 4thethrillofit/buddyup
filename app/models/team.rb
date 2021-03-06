class Team < ActiveRecord::Base
  attr_accessible :name
  attr_accessor :member_email

  validates :name, :presence => true,
                   :length => { :maximum => 10 }

  has_many :team_assignments, :dependent => :destroy
  has_many :members, :source => :person, :through => :team_assignments
  has_many :buddy_pairs

  def member_email=(email)
    self.members = Person.find_by_name(email)
  end

  #throw into rake task
  def generate_pair_records
    generate_permutations.each do |pair|
      self.buddy_pairs.create(permutation: pair)
    end
  end

  def generate_pair_for_new_member(member)
    self.members.pluck(:id).each do |existing_member_id|
      next if member.id == existing_member_id
      pair = [member.id, existing_member_id].sort
      self.buddy_pairs.create(permutation: pair)
    end
  end

  #a lot going on in this method. would like to refactor this.
  #if using clockwork file, please remove #clean_weekly_pair_records!
  def generate_weekly_pairs
    clean_weekly_pair_records
    weekly_pairs = []
    self.buddy_pairs.shuffle.each do |pair_obj|
      pair_ids = pair_obj.permutation
      person1 = Person.find_by_id(pair_ids[0])
      person2 = Person.find_by_id(pair_ids[1])
      next if should_not_pair?(pair_obj, person1, person2)
      pair_obj.people.push(person1, person2)
      pair_obj.update_attribute(:has_been_assigned, true)
      weekly_pairs.push([person1, person2])
    end
    reset_pair_records if all_pairs_assigned?
    orphan_members.each do |member|
      member.count == 1 ? weekly_pairs.sample.concat(member) : weekly_pairs.push(member)
    end
    weekly_pairs
  end

  def destroy_related_pairs(member)
    #destroy_all or delete_all do not work here on the array
    self.buddy_pairs.select{|pair| pair.permutation.include?(member.id) }.each(&:delete)
  end

private
  def generate_permutations
    #pluck out all person_id for a given team and generate unique permutations
    self.members.pluck(:id).permutation(2).to_a.map(&:sort).uniq
  end

  def should_not_pair?(pair_obj, person1, person2)
    return true if pair_obj.has_been_assigned || person1.buddy_pair || person2.buddy_pair
    false
  end

  def all_pairs_assigned?
    return false if buddy_pairs.select{|pair| !pair.has_been_assigned}.any?
    true
  end

  def reset_pair_records
    buddy_pairs.update_all(:has_been_assigned => false)
  end

  def orphan_members
    orphans = members.where(:buddy_pair_id => nil).shuffle
    pairs = []
    while orphans.any?
      pairs.push orphans.pop(2)
    end
    pairs
  end

  def clean_weekly_pair_records
    buddy_pairs.each { |pair| pair.people.delete_all }
  end
end
