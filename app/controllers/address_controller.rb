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
    @address = Address.new(address_params[:address])

    #this is to make a request to the wrapper/api:

    #     @address.address == params[:address]
    #     @address.city == params[:city]
    #     @address.state == params[:state]
    #     @address.zip == params[:zip]
    #
    # address_info = { }
    # address_info[:adress] = { address: params[:address], city: params[:city], state: params[:state], zip: params[:zip]}
    #
    #
    # address_info.to_json
    #
    # @response = ContactWrapper.send_request(address_info)

    render "rants/new"
  end

  def update

  end
end

private
  def address_params
    params.permit(address: [:address, :address2, :city, :state, :zip, :user_id])

  end
