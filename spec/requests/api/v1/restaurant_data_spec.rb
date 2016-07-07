require 'rails_helper'

RSpec.describe 'Restaurant Data', type: :request do

  describe 'GET /api/v1/restaurant_data' do

    let!(:cat) { FactoryGirl.create(:restaurant_category, title: 'Thai') }
    let!(:cat2) { FactoryGirl.create(:restaurant_category, title: 'Italian') }
    let!(:restaurant) { FactoryGirl.create(:restaurant, name: 'Thai 1', restaurant_category: cat) }
    let!(:restaurant2) { FactoryGirl.create(:restaurant, name: 'Thai 2', restaurant_category: cat) }
    let!(:restaurant3) { FactoryGirl.create(:restaurant, name: 'Italian Dining', restaurant_category: cat2) }

    it 'gets 2 thai restaurants' do
      get '/api/v1/restaurant_data', cat: 'Thai'
      expect(response_json['entries'].count).to eq 2
    end

    it 'gets 1 italian restaurant' do
      get '/api/v1/restaurant_data', cat: 'Italian'
      expect(response_json['entries'].count).to eq 1
    end

    it 'displays correct restaurant name' do
      get '/api/v1/restaurant_data', cat: 'Italian'
      expect(response_json['entries'][0]['name']).to eq "Italian Dining"
    end
  end
end
