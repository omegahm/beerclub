require 'rails_helper'

RSpec.describe ProductsController do

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { 'name' => 'Beer', 'price' => '2.5' } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsController. Be sure to keep this updated too.
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
      it 'assigns all products as @products' do
        product = Product.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:products)).to eq([product])
      end
    end

    describe 'GET new' do
      it 'assigns a new product as @product' do
        get :new, {}, valid_session
        expect(assigns(:product)).to be_a_new(Product)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested product as @product' do
        product = Product.create! valid_attributes
        get :edit, { id: product.to_param }, valid_session
        expect(assigns(:product)).to eq(product)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Product' do
          expect do
            post :create, { product: valid_attributes }, valid_session
          end.to change(Product, :count).by(1)
        end

        it 'assigns a newly created product as @product' do
          post :create, { product: valid_attributes }, valid_session
          expect(assigns(:product)).to be_a(Product)
          expect(assigns(:product)).to be_persisted
        end

        it 'redirects to index' do
          post :create, { product: valid_attributes }, valid_session
          expect(response).to redirect_to(products_path)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved product as @product' do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Product)
            .to receive(:save)
            .and_return(false)

          post :create, { product: { 'price' => 'invalid' } }, valid_session
          expect(assigns(:product)).to be_a_new(Product)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Product)
            .to receive(:save)
            .and_return(false)

          post :create, { product: { 'price' => 'invalid' } }, valid_session
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'updates the requested product' do
          product = Product.create! valid_attributes
          # Assuming there are no other products in the database, this
          # specifies that the Product created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          expect_any_instance_of(Product)
            .to receive(:update)
            .with('price' => '3')

          put :update, { id: product.to_param, product: { 'price' => '3' } }, valid_session
        end

        it 'assigns the requested product as @product' do
          product = Product.create! valid_attributes
          put :update, { id: product.to_param, product: valid_attributes }, valid_session
          expect(assigns(:product)).to eq(product)
        end

        it 'redirects to index' do
          product = Product.create! valid_attributes
          put :update, { id: product.to_param, product: valid_attributes }, valid_session
          expect(response).to redirect_to(products_path)
        end
      end

      describe 'with invalid params' do
        it 'assigns the product as @product' do
          product = Product.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Product)
            .to receive(:save)
            .and_return(false)

          put :update, { id: product.to_param, product: { 'price' => 'invalid' } }, valid_session
          expect(assigns(:product)).to eq(product)
        end

        it "re-renders the 'edit' template" do
          product = Product.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Product)
            .to receive(:save)
            .and_return(false)

          put :update, { id: product.to_param, product: { 'price' => 'invalid' } }, valid_session
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested product' do
        product = Product.create! valid_attributes
        expect do
          delete :destroy, { id: product.to_param }, valid_session
        end.to change(Product, :count).by(-1)
      end

      it 'redirects to the products list' do
        product = Product.create! valid_attributes
        delete :destroy, { id: product.to_param }, valid_session
        expect(response).to redirect_to(products_url)
      end
    end
  end
end
