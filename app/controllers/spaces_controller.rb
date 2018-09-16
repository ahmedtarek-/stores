class SpacesController < ApplicationController
  before_action :set_spaces, only: [:index]
  before_action :set_space, only: [:show, :update, :destroy]

  def index
  end

  def show
  end

  
  private

  def set_spaces
    @spaces = Space.all
  end


  def spaces_params
    params.permit(SpacesHelper.valid_params)
  end

end