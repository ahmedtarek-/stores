class StoresController < ApplicationController
  before_action :set_stores, only: [:index]

  def index
  end

  private

  def set_stores
    @stores = Store.all
  end
end