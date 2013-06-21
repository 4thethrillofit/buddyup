class Person < ActiveRecord::Base
  attr_accessible :name, :email, :team_names
  attr_writer :team_names

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, :presence => true
  validates :email, :presence => true,
                    :format => { :with => EMAIL_REGEX },
                    :uniqueness => true
  has_many :team_assignments, :dependent => :destroy
  has_many :teams, :through => :team_assignments
  before_save :downcase_email
  after_save :assign_teams

  #custom getter to return the current teams the person belongs to for edit actions if needed.
  def team_names
    @team_names ||= teams.map(&:name).join(',')
  end

private
  def assign_teams
    if @team_names
      self.teams = @team_names.split(',').map do |name|
        Team.find_or_create_by_name(name)
      end
    end
  end

  def downcase_email
    email.downcase!
  end
end