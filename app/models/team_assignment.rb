class TeamAssignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :team
end
