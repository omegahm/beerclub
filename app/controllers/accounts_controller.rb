class AccountsController < ApplicationController
  before_filter :require_administrator

  # GET /accounts
  def index
    @products = Product.visible.order(:id)

    @users = User
    @users = @users.visible unless params[:all]
    @users = @users.order_by_room
  end

  # PATCH/PUT /accounts
  def update
    worker = create_worker(params)

    worker.queue if Rails.env.production?
    worker.run_local unless Rails.env.production?

    flash[:notice] = 'Regnskab opdateret'
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render json: { url: root_url } }
    end
  end

  private

  def create_worker(params)
    # Create worker and assign values
    worker = IronWorkerNG::Client.new
    worker.tasks.create('account', account: params[:account], database: Rails.configuration.database_configuration[Rails.env])
    worker
  end
end
