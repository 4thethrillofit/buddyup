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

  def assign_buddy_pair
    # self.members
  end

end
