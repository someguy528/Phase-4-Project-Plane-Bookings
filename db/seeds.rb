# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# dummy_usernames = ["Jackie15", "Layton07", "Maria15", "Jill00" , "Ashley21"]
# dummy_names = ["Jackie", "Layton", "Maria", "Jill", "Ashley"]
# dummy_products = [
#     {name: "Potted Plant", description: "A nice plant", price: "15.00", available: true},
#     {name: "Hose 75ft", description: "A long hose", price: "34.99", available: true},
#     {name: "Metal Plate", description: "A metal plate of unknown uses", price: "19.99", available: true},
#     {name: "SSD 500gb", description: "This unknown brand SSD stores data", price: "79.99", available: true},
#     {name: "Rare Cd", description: "A hard to find cd", price: "119.99", available: false}
# ]

p "Creating Users..."

# 5.times do |i|
#     User.create(username: dummy_usernames[i], password: "abcd1234" , password_confirmation: "abcd1234", name: dummy_names[i])
# end
User.create(username: "Jackie15", password: "abcd1234" , password_confirmation: "abcd1234", name: "Jackie")
User.create(username: "Layton07", password: "abcd1234" , password_confirmation: "abcd1234", name: "Layton")
User.create(username: "Maria15", password: "abcd1234" , password_confirmation: "abcd1234", name: "Maria")
User.create(username: "Jill00", password: "abcd1234" , password_confirmation: "abcd1234", name: "Jill")
User.create(username: "Ashley21", password: "abcd1234" , password_confirmation: "abcd1234", name: "Ashley")

p "Creating Products..."
# new product seed

# User.first.products.create(dummy_products[0])
# User.second.products.create(dummy_products[1])
# User.third.products.create(dummy_products[2])
# User.fourth.products.create(dummy_products[3])
# User.fifth.products.create(dummy_products[4])

# User.first.products.create(name: "Potted Plant", description: "A nice plant", price: "15.00", available: true)
# User.second.products.create(name: "Hose 75ft", description: "A long hose", price: "34.99", available: true)
# User.third.products.create(name: "Metal Plate", description: "A metal plate of unknown uses", price: "19.99", available: true)
# User.fourth.products.create(name: "SSD 500gb", description: "This unknown brand SSD stores data", price: "79.99", available: true)
# User.fifth.products.create(name: "Rare Cd", description: "A hard to find cd", price: "119.99", available: false)

Product.create(name: "Potted Plant", description: "A nice plant", price: "15.00", seller_id: 1, available: 1)
Product.create(name: "Hose 75ft", description: "A long hose", price: "34.99", seller_id: 2, available: 1)
Product.create(name: "Metal Plate", description: "A metal plate of unknown uses", price: "19.99", seller_id: 3, available: 1)
Product.create(name: "SSD 500gb", description: "This unknown brand SSD stores data", price: "79.99", seller_id: 4, available: 1)
Product.create(name: "Rare Cd", description: "A hard to find cd", price: "119.99", seller_id: 5, available: 0)


