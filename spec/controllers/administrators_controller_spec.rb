require 'rails_helper'

describe AdministratorsController do
  describe 'GET #index' do
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

      it 'responds successfully with an HTTP 200 status code' do
        get :index
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end
  end
end
