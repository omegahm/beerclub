require 'csv'

namespace :import do
  desc "Import users"
  task users: :environment do
    puts 'Importing users and payments'
    CSV.foreach('lib/tasks/data/users.csv', col_sep: ';') do |row|
      # Temp Id | Name | Room | E-mail | Admin | Active | Paid | Color
      #    0    |  1   |   2  |    3   |    4  |    5   |   6  |   7

      u = User.create(temp_id: row[0], name: row[1], room: row[2], visible: row[5])
      raise "USER INVALID: #{row[1]}" unless u.valid?
      p = Payment.create(user_id: u.id, amount: row[6].to_f + 50.0)
      raise "PAYMENT INVALID: #{row[1]}" unless p.valid?
      print '.'
    end
    puts
  end

  desc "Import bills"
  task bills: [:users, :products] do
    puts 'Importing bills'
    CSV.foreach('lib/tasks/data/bill.csv', col_sep: ';') do |row|
      # Bill Id | Date | User Id | Product Id | Amount 
      #    0    |   1  |   2     |     3      |   4
      u = User.find_by_temp_id(row[2])
      p = Product.find_by_temp_id(row[3])
      b = Bill.create(user_id: u.id, product_id: p.id, price: p.price, quantity: row[4], created_at: Date.parse(row[1]))
      raise "BILL INVALID: #{row[0]}" unless b.valid?
      print '.'
    end
    puts
  end

  desc "Import products"
  task products: :environment do
    puts 'Importing products'
    CSV.foreach('lib/tasks/data/product_group.csv', col_sep: ';') do |row|
      # Temp Id | Long name | Short name | Price | Size
      #    0    |     1     |      2     |   3   |   4
      p = Product.create(temp_id: row[0], name: row[2], price: row[3])
      raise "PRODUCT INVALID: #{row[2]}" unless p.valid?
      print '.'
    end
    puts
  end

  desc "Import meta"
  task meta: :environment do
    puts 'Importing meta'
    Metum.create(cash: 8449, stock: 4130, loss: 271)
  end

  desc 'Import all'
  task all: [:users, :products, :bills, :meta] do
    puts "Imported everything"
  end

end
