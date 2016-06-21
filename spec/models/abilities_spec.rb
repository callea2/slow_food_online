require 'rails_helper'

RSpec.describe Ability, type: :model do
  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let(:customer) { FactoryGirl.create(:user, role: 'customer') }
  let(:rest_owner) { FactoryGirl.create(:user, role: 'restaurant_owner') }

  describe 'for admin' do
    subject(:ability) { Ability.new(admin) }

    context 'can manage all restaurants' do
      it { is_expected.to be_able_to(:manage, Restaurant.new) }
    end
  end

  describe 'for customer' do
    subject(:ability) { Ability.new(customer) }

    context 'cannot manage any restaurant' do
      it { is_expected.not_to be_able_to(:manage, Restaurant.new) }
    end

    context 'can read all restaurants' do
      it { is_expected.to be_able_to(:read, Restaurant.new) }
    end
  end

  describe 'for restaurant_owner' do
    subject(:ability) { Ability.new(rest_owner) }
    let(:rest_owner_2) { FactoryGirl.create(:user, username: 'SecondRestOwner', role: 'restaurant_owner') }

    context ':manage his own restaurant' do
      it { is_expected.to be_able_to(:manage, Restaurant.new(user: rest_owner)) }
    end

    context 'can\'t :manage not his restaurant' do
      it { is_expected.not_to be_able_to(:manage, Restaurant.new(user: rest_owner_2)) }
    end

    context ':read all restaurants' do
      it { is_expected.to be_able_to(:read, Restaurant.new) }
    end
  end

end
