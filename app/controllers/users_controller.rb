class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params[:user])
    if @user.save
      flash[:success] = "Success!!!"

      session[:user_id] = @user.id


      redirect_to root_path

    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  render :show
  end

  def edit
    @user = User.find(params[:id])
    render :new
  end

  private

  def user_create_params
    params.permit(user: [:name, :username, :email, :password, :password_confirmation])
  end
end









# class UsersController < ApplicationController
#   #skip_before_action :require_login, only: [:new, :create, :show]
#   def new
#     @user = User.new
#   end
#
#   def create
#     @user = User.new(user_create_params[:user])
#     @user.save
#     if @user.save
#       session[:user_id] = @user.id
#       redirect_to user_path(@user)
#     else
#       @user = User.new(user_create_params[:user])
#       render :new
#     end
#   end
#
#   def show
#     @user = User.find(params[:id])
#
#   end
#
#   def edit
#     @user = User.find(params[:id])
#     render :new
#   end
#
#   def update
#     user = User.find(params[:id])
#     user.update(user_create_params[:user])
#     if user_create_params[:user][:merchant] == false
#       user.products.update_all(retired: "true")
#     else
#       user.products.update_all(retired: "false")
#     end
#     redirect_to user_path(user)
#   end
#
#   private
#
#   def user_create_params
#     params.permit(user: [:utf8, :authenticity_token, :commit, :name, :username, :email, :password, :password_confirmation,:photo_url, :biography, :merchant])
#   end
# end
