require 'httparty'

class Rant < ActiveRecord::Base
  belongs_to :users

  validates :rant, presence: true
  validates :user_id, presence: true
end
