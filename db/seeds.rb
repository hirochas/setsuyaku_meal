｝# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
    email: 'admin@admin.com',
    password: 'adminok',
)

customers = Customer.create!(
  [
    {email: 'satou@test.com', name: '佐藤 ', password: 'password'},
    {email: 'yamamoto@test.com', name: '山本', password: 'password'},
    {email: 'suzuki@test.com', name: '鈴木', password: 'password', }
    ]
)

genres = Genre.create!(
  [
    {name: '卵を使った料理'},
    {name: '麺を使った料理'},
    {name: 'お肉を使った料理'},
    {name: '野菜を使った料理'}
  ]
)