class Person < ActiveRecord::Base
  attr_accessible :name, :email

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, :presence => true
  validates :email, :presence => true,
                    :format => { :with => EMAIL_REGEX },
                    :uniqueness => true
  has_many :team_assignments, :dependent => :destroy
  has_many :teams, :through => :team_assignments
  before_save :downcase_email
  accepts_nested_attributes_for :teams
  # def team_name
  #   team.try(:name)
  # end

  # def team_name=(name)
  #   self.team = Team.find_or_create_by_name(name) if name.present?
  # end

private
  def downcase_email
    email.downcase!
  end
end