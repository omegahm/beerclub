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
    # Create worker and assign values
    worker = IronWorkerNG::Client.new
    worker.tasks.create('account', account: params[:account], database: Rails.configuration.database_configuration[Rails.env])

    if Rails.env.production?
      worker.queue
    else
      worker.run_local
    end

    flash[:notice] = 'Regnskab opdateret'
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render json: { url: root_url } }
    end
  end
end
