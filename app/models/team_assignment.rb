class TeamAssignment < ActiveRecord::Base
  attr_accessible :has_been_assigned
  belongs_to :person
  belongs_to :team
end
