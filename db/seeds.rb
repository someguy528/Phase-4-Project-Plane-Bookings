# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

dummy_usernames = ["Jackie15", "Layton07", "Maria15", "Jill00" , "Ashley21"]
dummy_names = ["Jackie", "Layton", "Maria", "Jill", "Ashley"]
dummy_products = [
    {name: "Potted Plant", description: "A nice plant", price: "15.00", available: true},
    {name: "Hose 75ft", description: "A long hose", price: "34.99", available: true},
    {name: "Metal Plate", description: "A metal plate of unknown uses", price: "19.99", available: true},
    {name: "SSD 500gb", description: "This unknown brand SSD stores data", price: "79.99", available: true},
    {name: "Rare Cd", description: "A hard to find cd", price: "119.99", available: false}
]

p "Creating Users..."

dummy_usernames.each do |i|
    User.create(username: i , password: "abcd1234" , password_confirmation: "abcd1234", name: dummy_names[i])
end

p "Creating Products..."
# new product seed

User.first.products.create(dummy_products[0])
User.second.products.create(dummy_products[1])
User.third.products.create(dummy_products[2])
User.fourth.products.create(dummy_products[3])
User.fifth.products.create(dummy_products[4])


