class Person < ActiveRecord::Base
  attr_accessible :name, :email

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, :presence => true
  validates :email, :presence => true,
                    :format => { :with => EMAIL_REGEX },
                    :uniqueness => { case_sensitive: false }
  validates :buddy_id, :numericality => true
end
