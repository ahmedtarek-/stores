class StoresController < ApplicationController
  before_action :set_stores, only: [:index]

  def index
  end

  private

  def set_stores
    @stores = stores_params.present? ?
                Store.where(RequestsHelper.conditions_from_params(stores_params)) : Store.all
  end

  def stores_params
    params.permit(StoresHelper.valid_params)
  end
end