class HomeController < ApplicationController
  before_filter :set_product, only: [:graph]
  before_action :load_data, only: [:index, :account]

  # GET /
  def index
  end

  # GET /account.pdf
  def account
    @users    = @users.visible
    @products = @products.visible

    @total_paid    = @payments.map(&:second).reduce(:+) || 0.0
    @total_balance = (@balances.map(&:second).compact.reduce(:+) || 0.0) + @total_paid
    @total_money   = @total_balance + @last_month_meta[:stock] + @last_month_meta[:cash]

    @products_data = @products.reduce([]) { |a, e| a << [e.name, { content: view_context.number_to_currency(e.price), align: :right }] }
  end

  # GET /graph/:id
  def graph
    @product_counts, @bills, @dates = products_bills_and_dates
    @user_meta = Hash[User.all.select(:id, :name, :visible).map { |u| [u.id, [u.name, u.visible]] }]
  end

  private

  def products_bills_and_dates
    return @product_counts if @product_counts.present?

    # Gives [user_id, date] => quantity
    product_counts = Bill.select(:id, :user_id, :created_at, :quantity)
                         .where(product_id: @product.id)

    convert_product_counts(product_counts)
  end

  # We want user_id => [{ date => quanity }, { date2 => quantity2 }]
  def convert_product_counts(product_counts)
    bills, dates = {}, []

    product_counts.find_each do |product_count|
      user_id = product_count.user_id
      date    = product_count.created_at.to_date
      quanity = product_count.quantity

      dates << date
      bills[user_id] ||= {}
      bills[user_id][date] = quanity
    end

    [product_counts, bills, dates.uniq]
  end

  def load_data
    @users    = User.order_by_room
    @products = Product.order(:created_at)

    @payments = Payment.group(:user_id).sum(:amount)

    @quantities, @balances = quantites_balances
    set_totals(@products, @quantities)

    @sales_last_month = sales_last_month
    @last_month_meta  = Metum.last_month
    @last_bill        = Bill.last.try(&:created_at) || Date.today

    @settings = Setting.to_hash
  end

  def sales_last_month
    Bill.group('EXTRACT(DAY FROM bills.created_at)')
        .order('EXTRACT(DAY FROM bills.created_at) DESC')
        .sum('price * quantity')
        .first.try(:second).try(:to_f)
  end

  def quantites_balances
    bill_scope  = Bill.includes(:user).group(:user_id)
    quantities = bill_scope.group(:product_id).sum(:quantity)
    balances   = bill_scope.sum('bills.quantity * -bills.price')

    [quantities, balances]
  end

  def set_totals(products, quantities)
    return @totals if @totals.present?

    # We need all users and all products, not only visible ones
    @totals = {}
    User.find_each do |user|
      products.each do |product|
        @totals[product.id] ||= 0
        @totals[product.id] += (quantities[[user.id, product.id]].presence || 0)
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
end
