class PaymentsController < ApplicationController
  def index
    @users    = User.order_by_room
    @payments = Payment.group(:user_id).sum(:amount)
  end

  def show
    @user     = User.find(params[:id])
    @payments = @user.payments.order(:created_at).reject { |payment| payment.amount == 0 }
  end
end
