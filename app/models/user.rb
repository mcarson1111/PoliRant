require 'httparty'

class User < ActiveRecord::Base
  has_many :rants

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :uid, presence: true

  has_secure_password

  def self.log_in(email, password)
    somebody = User.find_by(email: email.downcase)
    somebody && somebody.authenticate(password)
  end

  def current_user?(current_user)
    return false if current_user == nil
    current_user.id == self.id ? true : false
  end


end
