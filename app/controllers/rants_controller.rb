class RantsController < ApplicationController
   skip_before_action :verify_authenticity_token


  def new
    @rant = Rant.new  #(rant_create_params))
    @user = User.find_by(id: session[:user_id])

  end

  def address
    #save address to rant...add in model and ?
  end

  def create
    @user = User.find_by(id: session[:user_id])
    #save rant to user
    @rant = @user.rants.new(rant_create_params[:rant])

    render :new
  end

  def show

  end

  def sent

  end


  private
  def rant_create_params
    params.permit(rant: [:id, :uid, :rant, :created_at, :updated_at])
  end

end
