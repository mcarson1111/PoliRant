require 'httparty'

class Rant < ActiveRecord::Base
  belongs_to :user
  has_one :address

  validates :rant, presence: true
  validates :user_id, presence: true
  validates :address_id, presence: true
end
