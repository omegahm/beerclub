require 'active_record'
require 'pg'

require './payment'
require './product'
require './bill'

ActiveRecord::Base.establish_connection(params['database'])

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

  puts "Running #{user_id}, #{product_id}"

  # Payments have a special ID
  if product_id == 0
    Payment.create(user_id: user_id, amount: hash['amount'].to_f)
  elsif product_prices[product_id].present?
    # We add together numbers around +
    sum = hash['quantity'].split(/\+/).map(&:to_i).sum
    Bill.create(user_id: user_id, product_id: product_id, price: product_prices[product_id], quantity: sum) if sum > 0
  end
end
