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

    if Rails.env.production?
      worker.queue
    else
      worker.run_local
    end

    flash[:notice] = 'Regnskab opdateret'
    redirect_to root_path
  end

  private

  def create_worker(params)
    # Create worker and assign values
    worker = IronWorkerNG::Client.new
    worker.tasks.create('account', account: params[:account], database: Rails.configuration.database_configuration[Rails.env])
    worker
  end
end
