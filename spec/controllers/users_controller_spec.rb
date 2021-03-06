require 'rails_helper'

RSpec.describe UsersController do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { 'name' => 'Ohm', 'room' => '410' } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context 'not logged in' do
    it 'redirects back to frontpage' do
      get :index
      expect(response).to be_redirect
      expect(response).to redirect_to(root_path)
    end
  end

  context 'logged in' do
    before do
      stub_admin
    end

    describe 'GET index' do
      it 'assigns all users as @users' do
        user = User.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:users)).to eq([user])
      end
    end

    describe 'GET new' do
      it 'assigns a new user as @user' do
        get :new, {}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested user as @user' do
        user = User.create! valid_attributes
        get :edit, { id: user.to_param }, valid_session
        expect(assigns(:user)).to eq(user)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new User' do
          expect do
            post :create, { user: valid_attributes }, valid_session
          end.to change(User, :count).by(1)
        end

        it 'assigns a newly created user as @user' do
          post :create, { user: valid_attributes }, valid_session
          expect(assigns(:user)).to be_a(User)
          expect(assigns(:user)).to be_persisted
        end

        it 'redirects to index' do
          post :create, { user: valid_attributes }, valid_session
          expect(response).to redirect_to(users_path)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved user as @user' do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(User)
            .to receive(:save)
            .and_return(false)

          post :create, { user: { 'name' => 'invalid value' } }, valid_session
          expect(assigns(:user)).to be_a_new(User)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(User)
            .to receive(:save)
            .and_return(false)

          post :create, { user: { 'name' => 'invalid value' } }, valid_session
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'updates the requested user' do
          user = User.create! valid_attributes
          # Assuming there are no other users in the database, this
          # specifies that the User created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          expect_any_instance_of(User)
            .to receive(:update)
            .with('name' => 'MyString')

          put :update, { id: user.to_param, user: { 'name' => 'MyString' } }, valid_session
        end

        it 'assigns the requested user as @user' do
          user = User.create! valid_attributes
          put :update, { id: user.to_param, user: valid_attributes }, valid_session
          expect(assigns(:user)).to eq(user)
        end

        it 'redirects to the user' do
          user = User.create! valid_attributes
          put :update, { id: user.to_param, user: valid_attributes }, valid_session
          expect(response).to redirect_to(users_path)
        end
      end

      describe 'with invalid params' do
        it 'assigns the user as @user' do
          user = User.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(User)
            .to receive(:save)
            .and_return(false)

          put :update, { id: user.to_param, user: { 'name' => 'invalid value' } }, valid_session
          expect(assigns(:user)).to eq(user)
        end

        it "re-renders the 'edit' template" do
          user = User.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(User)
            .to receive(:save)
            .and_return(false)

          put :update, { id: user.to_param, user: { 'name' => 'invalid value' } }, valid_session
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested user' do
        user = User.create! valid_attributes
        expect do
          delete :destroy, { id: user.to_param }, valid_session
        end.to change(User, :count).by(-1)
      end

      it 'redirects to the users list' do
        user = User.create! valid_attributes
        delete :destroy, { id: user.to_param }, valid_session
        expect(response).to redirect_to(users_url)
      end
    end
  end
end
