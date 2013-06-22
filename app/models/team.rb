class Team < ActiveRecord::Base
  attr_accessible :name
  attr_accessor :member_email

  validates :name, :presence => true,
                   :length => { :maximum => 10 }

  has_many :team_assignments, :dependent => :destroy
  has_many :members, :source => :person, :through => :team_assignments

  def member_email=(email)
    self.members = Person.find_by_name(email)
  end

end
