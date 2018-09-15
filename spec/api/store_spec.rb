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

    it 'returns stores matching filtered title' do
      non_matching_stores = StoreFactory.create_stores(2)
      matching_stores     = StoreFactory.create_stores(1, { title: "Yamaha" })

      get '/stores', { title: "eq:Yamaha" }
      stores_ids = JSON.parse(response.body)['stores'].map { |s| s['id'] }

      expect(stores_ids.size).to eq(1)
      expect(stores_ids).to include(matching_stores)
      expect(stores_ids).to_not include(non_matching_stores)
    end

  end
end