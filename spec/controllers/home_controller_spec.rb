require "spec_helper"

describe HomeController do
  describe "GET index" do
    it "assigns all users" do
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @user3 = FactoryGirl.create(:user, visible: false)
      get :index
      assigns(:users).should eq([@user1, @user2, @user3])
    end

    it "assigns all products" do
      @product1 = FactoryGirl.create(:product)
      @product2 = FactoryGirl.create(:product)
      @product3 = FactoryGirl.create(:product, visible: false)
      get :index
      assigns(:products).should eq([@product1, @product2, @product3])
    end
  end

  describe "GET graph" do
  end

  describe "GET account" do
    before do
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @user3 = FactoryGirl.create(:user, visible: false)
      @product1 = FactoryGirl.create(:product)
      @product2 = FactoryGirl.create(:product)
      @product3 = FactoryGirl.create(:product, visible: false)
    end

    it "renders" do
      get :account, format: :pdf
      response.should render_template("account")
    end

    it "assigns only visible users and products" do
      get :account, format: :pdf
      assigns(:users).should eq([@user1, @user2])
      assigns(:products).should eq([@product1, @product2])
    end
  end
end
