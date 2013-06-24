class BuddyPair < ActiveRecord::Base
  attr_accessible :permutation
  validates_presence_of :permutation, :team_id
  validate :check_data_type
  belongs_to :team
  has_many :people

  def self.clean_weekly_pair_records
    BuddyPair.all.each do |pair|
      pair.people.delete_all
    end
  end

private
  def check_data_type
    if self.permutation.class != Array
      errors.add(:permutation, "Buddy permutation must be an array")
    end
  end
end
