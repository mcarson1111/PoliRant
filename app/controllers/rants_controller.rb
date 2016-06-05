class RantsController < ApplicationController


  def new
    @rant = Rant.new(session[:user_id])

  end

  def address
  end

  def save
    self.new
  end

end
