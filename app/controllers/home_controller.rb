class HomeController < ApplicationController
  # GET /
  def index
    @users = User.order_by_room.visible
    @products = Product.visible

    @payments = Payment.group(:user_id).sum(:amount)
    bill_scope = Bill.joins(:user).where("users.visible = 't'").group(:user_id)
    @quantities = bill_scope.group(:product_id).sum(:quantity)
    @balances = bill_scope.sum("bills.quantity * -bills.price")

    @totals = {}
    @users.each do |user|
      Product.all.each do |product|
        @totals[product.id] ||= 0 
        @totals[product.id] += (@quantities[[user.id, product.id]].presence || 0)
      end
    end

    @sales_last_month = Bill.group("date_trunc('day', created_at)").order("date_trunc_day_created_at DESC").sum("price * quantity").first.second.to_f
    @last_month_meta = Metum.last_month
  end
end
