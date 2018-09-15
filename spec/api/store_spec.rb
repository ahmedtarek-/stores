require 'rails_helper'

RSpec.describe 'Store API' do
  describe 'GET /stores' do
    it 'returns 200' do
      get ('stores')
      expect(response).to have_http_status(200)
    end
  end
  
end