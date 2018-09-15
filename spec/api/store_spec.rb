require 'rails_helper'
require 'factories/store_factory'

RSpec.describe 'Store API' do
  describe 'GET /stores' do
    it 'returns 200' do
      get ('/stores')
      expect(response).to have_http_status(200)
    end

    it 'returns all stores' do
      StoreFactory.create_stores(3)
      get ('/stores')
      json = JSON.parse(response.body)
      expect(json['stores'].size).to eq(3)
    end

  end
end