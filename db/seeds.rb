# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
super_admin = AdminUser.create!(
  name: 'SuperUser',
  password: '123456',
  email: 'super_admin@bikelease.com',
  phone: '+3301636366',
  role_type: :super_admin,
  status: :active
)
p("super admin created with email #{super_admin.email}")
