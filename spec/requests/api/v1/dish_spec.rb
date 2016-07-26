require 'rails_helper'

RSpec.describe 'Dish Data', type: :request do

  describe 'GET /api/v1/dishes' do

    let!(:menu1) { FactoryGirl.create(:menu, name: 'Fish') }
    let!(:menu2) { FactoryGirl.create(:menu, name: 'Steaks') }
    let!(:dish1) { FactoryGirl.create(:dish, name: 'Fish soup', menu: menu1) }
    let!(:dish2) { FactoryGirl.create(:dish, name: 'Salmon', menu: menu1) }
    let!(:dish3) { FactoryGirl.create(:dish, name: 'T-bone steak', menu: menu2) }

    it 'gets 2 dishes from fish menu' do
      get '/api/v1/dishes', menu: 'Fish'
      expect(response_json['entries'].count).to eq 2
    end

    it 'gets 1 dish from steak menu' do
      get '/api/v1/dishes', menu: 'Steaks'
      expect(response_json['entries'].count).to eq 1
    end

    it 'displays correct dish name' do
      get '/api/v1/dishes', menu: 'Fish'
      expect(response_json['entries'][0]['name']).to eq "Fish soup"
      expect(response_json['entries'][1]['name']).to eq "Salmon"
    end
  end
end
