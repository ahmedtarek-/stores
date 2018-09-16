class SpacesController < ApplicationController
  before_action :set_spaces, only: [:index]
  before_action :set_space, only: [:show, :update, :destroy]

  def index
  end

  def show
  end

  def create
    @space = Space.new(space_create_params)

    if @space.save
      render :show, status: :ok
    else
      render json: { errors: { space: @space.errors }}, status: :unprocessable_entity
    end
  end

  def update
    if @space.update(space_create_params)
      render :show, status: :ok
    else
      render json: { errors: { space: @space.errors }}, status: :unprocessable_entity
    end
  end


  
  private

  def set_spaces
    @spaces = Space.all
  end

  def set_space
  	@space = Space.find(params[:id])
  end

  def spaces_params
    params.permit(SpacesHelper.valid_params)
  end

  def space_create_params
  	params.require(:space).permit(SpacesHelper.valid_params)
  end

end