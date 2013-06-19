class Person < ActiveRecord::Base
  attr_accessible :name, :email

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, :presence => true
  validates :email, :presence => true,
                    :format => { :with => EMAIL_REGEX },
                    :uniqueness => true
  has_many :team_assignments
  has_many :teams, :through => :team_assignments
  before_save :downcase_email

private
  def downcase_email
    email.downcase!
  end
end
