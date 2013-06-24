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

  def generate_weekly_pairs
    reset_pair_records if all_pairs_assigned?
    weekly_pair = []
    self.buddy_pairs.each do |pair_obj|
      pair_ids = pair_obj.permutation
      person1 = Person.find_by_id(pair_ids[0])
      person2 = Person.find_by_id(pair_ids[1])
      next if should_not_pair?(pair_obj, person1, person2)
      pair_obj.people.push(person1, person2)
      pair_obj.update_attribute(:has_been_assigned, true)
      weekly_pair.push([person1, person2])
    end
    BuddyPair.clean_weekly_pair_records
    # pair_obj.clean_weekly_pair_records
    weekly_pair
  end

private
  def generate_permutations
    #pluck out all person_id for a given team and generate unique permutations
    self.members.pluck(:id).permutation(2).to_a.map(&:sort).uniq
  end

  def should_not_pair?(pair_obj, person1, person2)
    if pair_obj.has_been_assigned || person1.buddy_pair || person2.buddy_pair
      true
    else
      false
    end
  end

  def all_pairs_assigned?
    return false if buddy_pairs.select{|pair| !pair.has_been_assigned}.any?
    true
  end

  def reset_pair_records
    buddy_pairs.update_all(:has_been_assigned => false)
  end
end
