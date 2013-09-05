require 'justonedb'
require 'active_record'
require 'models/payment'
require 'models/bill'

ActiveRecord::Base.establish_connection(params['database'])

user_id = params[:user_id]
product_id = params[:product_id]
hash = params[:hash]

# Payments have a special ID
if product_id == 0
  Payment.create(user_id: user_id, amount: hash['amount'].to_f)
elsif product_prices[product_id].present?
  # We add together numbers around +
  sum = hash['quantity'].split(/\+/).map(&:to_i).sum
  Bill.create(user_id: user_id, product_id: product_id, price: product_prices[product_id], quantity: sum) if sum > 0
end