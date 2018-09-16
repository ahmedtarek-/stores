require 'rails_helper'
require 'factories/space_factory'

RSpec.describe 'Space API' do
  describe 'GET /spaces' do
    it 'returns 200' do
      get ('/spaces')
      expect(response).to have_http_status(200)
    end

    it 'returns all spaces' do
      SpaceFactory.create_spaces(3)
      get ('/spaces')
      json = JSON.parse(response.body)
      expect(json['spaces'].size).to eq(3)
    end

  end

  describe 'GET /spaces/:id' do
    it 'returns correct space' do
      space_id = SpaceFactory.create_spaces(1).first.id
      
      get ("/spaces/#{space_id}")
      json = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(json['space']['id']).to eq(space_id)
    end
  end

  describe 'POST /spaces' do
    it 'creates new space - when given valid params' do
      params = {
        title: "New Space",
        size: 300,
        price_per_day: 100,
        price_per_week: 700,
        price_per_month: 3000
      }
      expect { post '/spaces', { space: params } }.to change(Space, :count).from(0).to(1)
    end
  end

  describe 'PUT /spaces/:id' do
    it 'updates store' do
      store = SpaceFactory.create_spaces(1).first
      
      params = {
        title:  "New Store",
        street: "Clockwork 12"
      }

      put "/spaces/#{store.id}", { store: params }
      
      store = Space.find(store.id)
      params.keys.each do |key|
        expect(store.attributes[key.to_s]).to eq params[key]
      end
    end
  end

  describe 'DELETE /spaces/:id' do
    it 'deletes space' do
      space = SpaceFactory.create_spaces(1).first
      
      expect { delete "/spaces/#{space.id}" }.to change(Store, :count).from(1).to(0)
    end
  end
end