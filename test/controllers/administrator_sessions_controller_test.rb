require 'test_helper'

class AdministratorSessionsControllerTest < ActionController::TestCase
  setup do
    @administrator_session = administrator_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administrator_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administrator_session" do
    assert_difference('AdministratorSession.count') do
      post :create, administrator_session: { password: @administrator_session.password, username: @administrator_session.username }
    end

    assert_redirected_to administrator_session_path(assigns(:administrator_session))
  end

  test "should show administrator_session" do
    get :show, id: @administrator_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administrator_session
    assert_response :success
  end

  test "should update administrator_session" do
    patch :update, id: @administrator_session, administrator_session: { password: @administrator_session.password, username: @administrator_session.username }
    assert_redirected_to administrator_session_path(assigns(:administrator_session))
  end

  test "should destroy administrator_session" do
    assert_difference('AdministratorSession.count', -1) do
      delete :destroy, id: @administrator_session
    end

    assert_redirected_to administrator_sessions_path
  end
end
