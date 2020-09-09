# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(:title => 'Learn Web Development with Rails',
    :description => 
    %{
        Ruby on Rails Tutorial book and screencast series 
        teach you how to develop and deploy real, 
        industrial-strength web applications with Ruby on Rails.
    },
    :image_url => '123.jpeg',
    :price => 29.99)
  
Product.create(:title => 'The Ruby Programming Language',
    :description =>
    %{
        The Ruby Programming Language is the authoritative guide 
        to Ruby and provides comprehensive coverage 
        of versions 1.8 and 1.9 of the language.
    },
    :image_url => '234.jpg',
    :price => 39.99)