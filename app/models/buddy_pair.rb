class BuddyPair < ActiveRecord::Base
  attr_accessible :permutation
  validates_presence_of :permutation, :team_id
  validate :check_data_type
  belongs_to :team

private
  def check_data_type
    if self.permutation.class != Array
      errors.add(:permutation, "Buddy permutation must be an array")
    end
  end
end
