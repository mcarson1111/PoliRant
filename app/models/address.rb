class Address < ActiveRecord::Base
  belongs_to :user
  has_many :rants

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }

end
