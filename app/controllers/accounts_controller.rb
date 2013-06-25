class AccountsController < ApplicationController
  before_filter :require_administrator

  # GET /accounts
  def index
    @products = Product.visible

    if params[:all] 
      @users = User.order_by_room
    else
      @users = User.visible.order_by_room
    end
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
    @product_prices = Product.select(:id, :price).inject({}) {|hash, p| hash[p.id] = p.price; hash}

    @account = params[:account]

    @account.each do |line|
      user_id, product_id = line.first.split(/_/).map(&:to_i)
      hash = line.second.first

      if product_id == 0
        # Product id 0 is payments
        Payment.create(user_id: user_id, amount: hash['amount'].to_f)
      else
        if hash['quantity'].to_i > 0 and @product_prices[product_id].present?
          Bill.create(user_id: user_id, product_id: product_id, price: @product_prices[product_id], quantity: hash['quantity'])
        end
      end
    end

    redirect_to root_path, notice: 'Regnskab opdateret.'
  end
end
