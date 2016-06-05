class RantsController < ApplicationController


  def new
    @rant = Rant.new(session[:user_id])

  end

  def create

  end


end
