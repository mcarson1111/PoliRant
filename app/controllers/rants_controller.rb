class RantsController < ApplicationController
   skip_before_action :verify_authenticity_token


  def new
    @rant = Rant.new(session[:user_id])

  end

  def address
  end

  def create
    self.new
    render :new
  end

end
