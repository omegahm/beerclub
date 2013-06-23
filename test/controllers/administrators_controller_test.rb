require 'test_helper'

class AdministratorControllerTest < ActionController::TestCase
  setup do
    @administrator = administrators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administrator)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administrator" do
    assert_difference('Administrator.count') do
      post :create, administrator: { crypted_password: @administrator.crypted_password, email: @administrator.email, password_salt: @administrator.password_salt, persistence_token: @administrator.persistence_token, username: @user.username }
    end

    assert_redirected_to administrator_path(assigns(:administrator))
  end

  test "should show administrator" do
    get :show, id: @administrator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administrator
    assert_response :success
  end

  test "should update administrator" do
    patch :update, id: @administrator, administrator: { crypted_password: @administrator.crypted_password, email: @administrator.email, password_salt: @administrator.password_salt, persistence_token: @administrator.persistence_token, username: @user.username }
    assert_redirected_to administrator_path(assigns(:administrator))
  end

  test "should destroy administrator" do
    assert_difference('Administrator.count', -1) do
      delete :destroy, id: @administrator
    end

    assert_redirected_to administrators_path
  end
end
