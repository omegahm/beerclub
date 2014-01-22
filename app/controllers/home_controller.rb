class HomeController < ApplicationController
  before_filter :set_product, only: [:graph]
  caches_action :graph, expires_in: 1.day

  # GET /
  def index
    load_data
  end

  # GET /account.pdf
  def account
    load_data
    @users = @users.visible
    @products = @products.visible
  end

  # GET /graph/:id
  def graph
    # Gives [user_id, date] => quantity
    @product_counts = Bill.where('product_id = ?', @product.id).group('bills.user_id').group("EXTRACT(DAY FROM bills.created_at)").order('EXTRACT(DAY FROM bills.created_at)').sum('quantity')

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
    @products = Product.order(:created_at)

    @payments = Payment.group(:user_id).sum(:amount)
    bill_scope = Bill.joins(:user).group(:user_id)
    @quantities = bill_scope.group(:product_id).sum(:quantity)
    @balances = bill_scope.sum('bills.quantity * -bills.price')

    # We need all users and all products, not only visible ones
    @totals = {}
    User.find_each do |user|
      @products.each do |product|
        @totals[product.id] ||= 0
        @totals[product.id] += (@quantities[[user.id, product.id]].presence || 0)
      end
    end

    @sales_last_month = Bill.group("EXTRACT(DAY FROM created_at)").order('EXTRACT(DAY FROM bills.created_at) DESC').sum('price * quantity').first.try(:second).try(:to_f)
    @last_month_meta = Metum.last_month
    @last_bil = Bill.last.try(&:created_at) || Date.today
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
end
