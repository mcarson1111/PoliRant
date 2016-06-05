class RantsController < ApplicationController
   skip_before_action :verify_authenticity_token


  def new
    @rant = Rant.new(rant_create_params)

  end

  def address
  end

  def create
    self.new
    render :new
  end

  def show

  end

  private
  def rant_create_params
    params.permit(rant: [:id, :uid, :rant, :created_at, :updated_at])
  end

end
