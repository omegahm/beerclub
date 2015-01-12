require 'rails_helper'

RSpec.describe HomeController do
  before do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @user3 = FactoryGirl.create(:user, visible: false)
    @product1 = FactoryGirl.create(:product)
    @product2 = FactoryGirl.create(:product)
    @product3 = FactoryGirl.create(:product, visible: false)
    FactoryGirl.create(:bill, user: @user1, product: @product1)
  end

  describe 'GET index' do
    it 'assigns all users' do
      get :index
      expect(assigns(:users)).to eq([@user1, @user2, @user3])
    end

    it 'assigns all products' do
      get :index
      expect(assigns(:products)).to eq([@product1, @product2, @product3])
    end
  end

  describe 'GET graph' do
  end

  describe 'GET account' do
    it 'renders' do
      get :account, format: :pdf
      expect(response).to render_template('account')
    end

    it 'assigns only visible users and products' do
      get :account, format: :pdf
      expect(assigns(:users)).to eq([@user1, @user2])
      expect(assigns(:products)).to eq([@product1, @product2])
    end
  end
end
