class HomeController < ApplicationController
  # GET /
  def index
    load_data
  end

  # GET /account.pdf
  def account
    load_data
  end

  # GET /graph/:id
  def graph
    set_product
    
    # Gives [user_id, date] => quantity
    @product_counts = Bill.where("product_id = ?", @product.id).group("bills.user_id").group("date_trunc('day', bills.created_at)").order("date_trunc_day_bills_created_at").sum("quantity")

    # We want user_id => [{ date => quanity }, { date2 => quantity2 }]
    @bills = {}
    @dates = []
    @product_counts.each do |product_count|
      user_id = product_count.first.first
      date = product_count.first.second
      quanity = product_count.second

      @dates << date
      @bills[user_id] ||= {}
      @bills[user_id][Date.parse(date.inspect).to_s] = quanity
    end

    @dates.uniq!

    @user_meta = Hash[User.all.select(:id, :name, :visible).map { |u| [u.id, [u.name, u.visible]] }]
  end

  private
    def load_data
      @users = User.order_by_room
      @products = Product.all

      unless params[:all]
        @users = @users.visible
        @products = @products.visible
      end

      @payments = Payment.group(:user_id).sum(:amount)
      bill_scope = Bill.joins(:user).group(:user_id)
      @quantities = bill_scope.group(:product_id).sum(:quantity)
      @balances = bill_scope.sum("bills.quantity * -bills.price")

      # We need all users and all products, not only visible ones
      @totals = {}
      User.all.each do |user|
        Product.all.each do |product|
          @totals[product.id] ||= 0 
          @totals[product.id] += (@quantities[[user.id, product.id]].presence || 0)
        end
      end

      @sales_last_month = Bill.group("date_trunc('day', created_at)").order("date_trunc_day_created_at DESC").sum("price * quantity").first.try(:second).try(:to_f)
      @last_month_meta = Metum.last_month
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
