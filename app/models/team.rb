class Team < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true,
                   :length => { :maximum => 10 }

  has_many :team_assignments
  has_many :team_members, :source => :people, :through => :team_assignments
end
