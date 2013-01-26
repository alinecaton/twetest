class Tweet < ActiveRecord::Base
  attr_accessible :tweets, :user_id

  belongs_to :user

  validates :tweets, presence: true
  validates :tweets, :length => { :maximum => 140 }
end
