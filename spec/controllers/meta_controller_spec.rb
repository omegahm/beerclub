require 'spec_helper'

describe MetaController do

  # This should return the minimal set of attributes required to create a valid
  # Metum. As you add validations to Metum, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "cash" => "1.5", "loss" => "1.5", "stock" => "1.5"  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MetaController. Be sure to keep this updated too.
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

    describe "GET index" do
      it "assigns all meta as @meta" do
        metum = Metum.create! valid_attributes
        get :index, {}, valid_session
        assigns(:meta).should eq([metum])
      end
    end

    describe "GET new" do
      it "assigns a new metum as @metum" do
        get :new, {}, valid_session
        assigns(:metum).should be_a_new(Metum)
      end
    end

    describe "GET edit" do
      it "assigns the requested metum as @metum" do
        metum = Metum.create! valid_attributes
        get :edit, { id: metum.to_param }, valid_session
        assigns(:metum).should eq(metum)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Metum" do
          expect {
            post :create, { metum: valid_attributes }, valid_session
          }.to change(Metum, :count).by(1)
        end

        it "assigns a newly created metum as @metum" do
          post :create, { metum: valid_attributes }, valid_session
          assigns(:metum).should be_a(Metum)
          assigns(:metum).should be_persisted
        end

        it "redirects to index" do
          post :create, { metum: valid_attributes }, valid_session
          response.should redirect_to(meta_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved metum as @metum" do
          # Trigger the behavior that occurs when invalid params are submitted
          Metum.any_instance.stub(:save).and_return(false)
          post :create, { metum: { "cash" => "invalid value" } }, valid_session
          assigns(:metum).should be_a_new(Metum)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Metum.any_instance.stub(:save).and_return(false)
          post :create, { metum: { "cash" => "invalid value" } }, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested metum" do
          metum = Metum.create! valid_attributes
          # Assuming there are no other meta in the database, this
          # specifies that the Metum created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Metum.any_instance.should_receive(:update).with({ "cash" => "1.5" })
          put :update, { id: metum.to_param, metum: { "cash" => "1.5" } }, valid_session
        end

        it "assigns the requested metum as @metum" do
          metum = Metum.create! valid_attributes
          put :update, { id: metum.to_param, metum: valid_attributes }, valid_session
          assigns(:metum).should eq(metum)
        end

        it "redirects index" do
          metum = Metum.create! valid_attributes
          put :update, { id: metum.to_param, metum: valid_attributes }, valid_session
          response.should redirect_to(meta_path)
        end
      end

      describe "with invalid params" do
        it "assigns the metum as @metum" do
          metum = Metum.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Metum.any_instance.stub(:save).and_return(false)
          put :update, { id: metum.to_param, metum: { "cash" => "invalid value" } }, valid_session
          assigns(:metum).should eq(metum)
        end

        it "re-renders the 'edit' template" do
          metum = Metum.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Metum.any_instance.stub(:save).and_return(false)
          put :update, { id: metum.to_param, metum: { "cash" => "invalid value" } }, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested metum" do
        metum = Metum.create! valid_attributes
        expect {
          delete :destroy, { id: metum.to_param }, valid_session
        }.to change(Metum, :count).by(-1)
      end

      it "redirects to the meta list" do
        metum = Metum.create! valid_attributes
        delete :destroy, { id: metum.to_param }, valid_session
        response.should redirect_to(meta_url)
      end
    end
  end
end
