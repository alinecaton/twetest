class User < ActiveRecord::Base
  attr_accessible :name, :username, :birthday

  validates :name, :username, :birthday, presence: true

  has_many :tweets
end
