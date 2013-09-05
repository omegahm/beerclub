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
    # Here we need to create a bill for each users purchases
    # A bill has an user and a product, as well as a quantity and a price
    # The price is the current price of the product

    # params[:account] will hold the entire account being proccessed
    # Each user has one entry for each product which is uid_pid.
    # The user also have one with id_0, which is the amount paid
    # If a user has id 1, we need to look for all 1_'s in the params[:account] array
    product_prices = Product.select(:id, :price).inject({}) {|hash, p| hash[p.id] = p.price; hash}

    params[:account].each do |line|
      user_id, product_id = line.first.split(/_/).map(&:to_i)
      hash = line.second.first

      next if hash.has_key?(:amount) and hash[:amount].blank?
      next if hash.has_key?(:quantity) and hash[:quantity].blank?
      next unless product_id == Payment::ID or product_prices[product_id].present?

      # Create worker and assign values
      worker = AccountWorker.new
      worker.user_id = user_id
      worker.product_id = product_id
      worker.hash = hash
      worker.product_prices = product_prices

      if Rails.env.production?
        worker.queue
      else
        worker.run_local
      end
    end

    redirect_to root_path, notice: 'Regnskab opdateret.'
  end
end
