require 'httparty'

class Rant < ActiveRecord::Base
  belongs_to :users

  validates :rant, presence: true
  validates :uid, presence: true
end
