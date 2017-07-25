# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Manager", enpno: "000000", password: 'mit4351', password_confirmation: 'mit4351', authority: "1")
User.create!(name: "SystemManager", enpno: "900000", password: 'mit4351', password_confirmation: 'mit4351', authority: "1")
