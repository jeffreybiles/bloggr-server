# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def link_bait
  case rand(4)
  when 0 
    Faker::Hacker.say_something_smart
  when 1
    Faker::Lorem.sentence(3)
  when 2
    baits = ['hot tips for', 'daily habits of', 'famous people who understand the power of']
    "#{rand(20)} #{baits[rand(3)]} #{Faker::Hacker.adjective} #{Faker::Hacker.noun} #{Faker::Hacker.ingverb}"
  when 3 
    "#{Faker::Commerce.product_name} from #{Faker::Commerce.department}"
  end
end

200.times do 
  Post.create(
    author: Faker::Name.name,
    title: link_bait,
    created_at: Faker::Date.between(6.months.ago, 2.months.ago),
    updated_at: Faker::Date.between(4.months.ago, 1.day.ago),
    body: Faker::Lorem.sentence(5),
    video_url: Faker::Internet.url
  )
end