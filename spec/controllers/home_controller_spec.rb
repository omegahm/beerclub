require "spec_helper"

describe HomeController do
  describe "GET index" do
    it "assigns visible users" do
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      @user3 = FactoryGirl.create(:user, visible: false)
      get :index
      assigns(:users).should eq([@user1, @user2])
    end

    it "assigns visible products" do
      @product1 = FactoryGirl.create(:product)
      @product2 = FactoryGirl.create(:product)
      @product3 = FactoryGirl.create(:product, visible: false)
      get :index
      assigns(:products).should eq([@product1, @product2])
    end
  end

  describe "GET graph" do
  end

  describe "GET account" do
    it "renders" do
      get :account, format: :pdf
      response.should render_template("account")
    end
  end
end
