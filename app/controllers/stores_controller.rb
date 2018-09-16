class StoresController < ApplicationController
  before_action :set_stores, only: [:index]

  def index
  end

  def show
  end

  def create
    @store = Store.new(store_create_params)

    if @store.save
      render :show, status: :ok
    else
      render json: { errors: { store: @store.errors }}, status: :unprocessable_entity
    end
  end

  private

  def set_stores
    @stores = stores_params.present? ?
                Store.where(RequestsHelper.conditions_from_params(stores_params)) : Store.all
  end

  def stores_params
    params.permit(StoresHelper.valid_params)
  end

  def store_create_params
    params.require(:store).permit(StoresHelper.valid_create_params)
  end
end