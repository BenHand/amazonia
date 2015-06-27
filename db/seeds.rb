# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do
  password = Faker::Internet.password
  user = User.create(name: Faker::Internet.name,
             email: Faker::Internet.safe_email,
          password: password, password_confirmation: password)

  product = Product.create(title: Faker::Commerce.product_name,
                     description: Faker::Lorem.sentence,
                           price: Faker::Commerce.price,
                       inventory: Faker::Number.number(2),
                             pic: "http://wackymania.com/image/2011/4/crazy-inventions/crazy-inventions-05.jpg")

  order = Order.create(user_id: user.id, complete: true)

  OrderProduct.create(product_id: product.id, order_id: order.id, quantity: Faker::Number.digit)

end
User.create(name: 'Ben', email: 'gneeshot@gmail.com',
        password: 'benspw', password_confirmation: 'benspw', admin: true)