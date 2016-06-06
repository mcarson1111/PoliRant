class RantsController < ApplicationController
  skip_before_action :verify_authenticity_token
   skip_before_action :require_login, only: [:new, :update_cart, :destroy, :create, :show]


  def index
    if params[:user_id].to_i == current_user.id
      @user = User.find(current_user.id)
      @rant = Rant.new

    else
      redirect_to login_path
    end
  end

  def show
    if current_user
      @rant = Rant.find(params[:id])
    elsif current_user.nil?
      @rant = Rant.find(params[:rant_id])
    else
      @rant = Rant.find(params[:user_id])

    end

  end

  def new
    @rant = Rant.new
    @address = Address.new(address_params[:address])

  end

  def create
    @address = Address.new(address_params[:address])
    if @address.save
      @user_id = session[:user_id] if session[:user_id]
      @address_id = @address.id
      @rant = Rant.new( address_id: @address_id, user_id: @user_id)
      if @rant.save
        render sent_path
      end
    end
  end

  



    def address_params
      params.permit(address: [:address, :address2, :city, :state, :zip, :user_id])

    end
end


#old code that works if this breaks:
  # def new
  #   @rant = Rant.new  #(rant_create_params))
  #   @user = User.find_by(id: session[:user_id])
  #
  # end
  #
  # def address
  #   #save address to rant...add in model and ?
  #   if current_user
  #     @address = Address.find_by(user_id: session[:user_id])
  #     unless @address
  #       @address = Address.new
  #     end
  #   else
  #     @address = Address.new
  #   end
  #   if current_user
  #     @user = User.find(session[:user_id])
  #   else
  #     @user = User.new
  #   end
  # end
  #
  # end
  #
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
  #
  # def show
  #
  # end
  #
  # def sent
  #
  # end
  #
  #
  #
  #
  # private
  # def rant_create_params
  #   params.permit(rant: [:id, :uid, :rant, :created_at, :updated_at])
  # end
