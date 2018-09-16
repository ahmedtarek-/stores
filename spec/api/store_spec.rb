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
      non_matching_stores_ids = StoreFactory.create_stores(2).map(&:id)
      matching_stores_ids     = StoreFactory.create_stores(1, { title: "Yamaha" }).map(&:id)

      get '/stores', { title: "eq:Yamaha" }
      stores_ids = JSON.parse(response.body)['stores'].map { |s| s['id'] }

      expect(stores_ids.size).to eq(matching_stores_ids.size)
      expect(stores_ids).to eq(matching_stores_ids)
    end
  end

  describe 'GET /store' do
    it 'returns correct store' do
      store_id = StoreFactory.create_stores(1).first.id
      
      get ("/stores/#{store_id}")
      json = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json['store']['id']).to eq(store_id)
    end
  end

  describe 'POST /stores' do
    it 'creates new stores - when given valid params' do
      params = {
        title: "New Store",
        city: "New Delhi",
        street: "Clockwork 12"
      }
      expect { post '/stores', { store: params } }.to change(Store, :count).from(0).to(1)
    end
  end

  describe 'PUT /store' do
    it 'updates store' do
      store = StoreFactory.create_stores(1).first
      
      params = {
        title:  "New Store",
        street: "Clockwork 12"
      }

      put "/stores/#{store.id}", { store: params }
      
      store = Store.find(store.id)
      params.keys.each do |key|
        expect(store.attributes[key.to_s]).to eq params[key]
      end
    end
  end
end