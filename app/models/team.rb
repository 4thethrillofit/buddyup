class Team < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true,
                   :length => { :maximum => 10 }
end
