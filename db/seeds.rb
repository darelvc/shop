# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Product.create!([{ name: 'apple', price: 5, description: 'green' },
                 { name: 'beer', price: 10, description: 'cold' },
                 { name: 'mobile phone', price: 100, description: 'very good phone' },
                 { name: 'milk', price: 40, description: 'white perfect milk' }])

User.create!([
  {
    name: 'Oleg Bloshenkin',
    email: 'test@test.com',
    password: 'test',
    password_confirmation: 'test'
  }, {
    name: 'Mariia Bloshenkina',
    email: 'test@test.ru',
    password: 'test',
    password_confirmation: 'test'
  }, {
    name: 'Ann',
    email: 'test@mlsdev.com',
    password: 'test',
    password_confirmation: 'test'
  }
])
