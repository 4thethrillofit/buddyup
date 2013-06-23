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
      pair = [member.id, existing_member_id].sort
      self.buddy_pairs.create(permutation: pair)
    end
  end

private
  def generate_permutations
    #pluck out all person_id for a given team and generate unique permutations
    #would rather use #pluck(:id) but use map to make rspec work.
    self.members.pluck(:id).permutation(2).to_a.map(&:sort).uniq
  end
end
