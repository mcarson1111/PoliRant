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
    # def create
    #   if session[:user_id]
    #     @user = User.find_by(id: session[:user_id])
    #     #save rant to user
    #     @rant = @user.rants.new(rant_create_params[:rant])
    #
    #     render :new
    #   else
    #     redirect_to new_user_path
    #   end
    # end
    render "rants/new"
  end

  def update

  end
end

private
  def address_params
    params.permit(address: [:address, :address2, :city, :state, :zip, :user_id])

  end
