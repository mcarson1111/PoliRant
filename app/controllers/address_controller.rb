require 'ContactWrapper'

class AddressController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login, only: [:new, :create]

  def index
  end

  def show
  end

  def new
    if current_user
      @address = Address.find_by(user_id: session[:user_id])
      unless @address
        @address = Address.new
      end
    else
      @address = Address.new
    end
    if current_user
      @user = User.find(session[:user_id])
    else
      @user = User.new
    end
  end


  def create
      address_string = "#{params[:address]} #{params[:city]}, #{params[:state]}"


    @response = ContactWrapper.send_request(address_string)

    render "rants/new"
  end

  def update

  end
end

private
  def address_params
    params.permit(address: [:address, :address2, :city, :state, :zip, :user_id])

  end
