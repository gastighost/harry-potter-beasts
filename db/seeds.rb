# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
require "nokogiri"

Creature.destroy_all
puts "Destroying all creatures"
User.destroy_all
puts "Destroying all users"

# Creating a user
dumbledore = User.create!(name: "Albus P. W. B. Dumbledore", email: "albus@gmail.com", password: "123456",
                          hogwarts_house: "gryffindor", years_of_magic: 732, owner: true, dark_magic: false)

hagrid = User.create!(name: "Rubeus Hagrid", email: "rubeus@gmail.com", password: "123456",
                      hogwarts_house: "gryffindor", years_of_magic: 50, owner: true, dark_magic: false)

riddle = User.create!(name: "Tom M. Riddle", email: "tom@gmail.com", password: "123456",
                      hogwarts_house: "slytherin", years_of_magic: 100, owner: true, dark_magic: true)

# Scraping beasts
url = "https://harrypotter.fandom.com/wiki/List_of_creatures"
html = URI.open(url)
doc = Nokogiri::HTML(html)

wanted_ul = doc.css("#mw-content-text .mw-parser-output ul")[2]
elements = wanted_ul.search("li > a")

beasts_array = []
elements.each do |element|
  beasts_array << element.text.strip
end

# Scraping Beings
url = "https://harrypotter.fandom.com/wiki/List_of_creatures"
html = URI.open(url)
doc = Nokogiri::HTML(html)

wanted_ul = doc.css("#mw-content-text .mw-parser-output ul")[17]
elements = wanted_ul.search("li > a")

beings_array = []
elements.each do |element|
  beings_array << element.text.strip
end

# Scraping Spirits
url = "https://harrypotter.fandom.com/wiki/List_of_creatures"
html = URI.open(url)
doc = Nokogiri::HTML(html)

wanted_ul = doc.css("#mw-content-text .mw-parser-output ul")[22]
elements = wanted_ul.search("li > a")

spirits_array = []
elements.each do |element|
  spirits_array << element.text.strip
end

# Method for scraping image
def scraping_img(creature)
  begin
    url = "https://harrypotter.fandom.com/wiki/#{creature}"
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    element = doc.search("aside figure a")
    return element.attribute("href").value
  rescue
    return "https://s7g8.scene7.com/is/image/BradfordUK/0302984001_alt1?wid=700&hei=700&fmt=pjpeg&qlt=85,0"
  end
end

# Seeding
def creating_beasts(user, creatures)
  creature = creatures.sample
  creature_url = creature.tr_s(" ", "_")
  href = scraping_img(creature_url) # scraping image
  file = URI.open(href)
  years = rand(1..200)
  name = Faker::FunnyName.name
  creature = Creature.new(name: name, category: "Beasts", breed: creature,
                          super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
  creature.photo.attach(io: file, filename: 'creature.png', content_type: 'image/png')
  creature.save
  puts "Beast created"
end

def creating_beings(user, creatures)
  creature = creatures.sample
  creature_url = creature.tr_s(" ", "_")
  href = scraping_img(creature_url) # scraping image
  file = URI.open(href)
  years = rand(1..100)
  name = Faker::FunnyName.name
  creature = Creature.new(name: name, category: "Beings", breed: creature,
                          super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
  creature.photo.attach(io: file, filename: 'creature.png', content_type: 'image/png')
  creature.save
  puts "Being created"
end

def creating_spirits(user, creatures)
  creature = creatures.sample
  creature_url = creature.tr_s(" ", "_")
  href = scraping_img(creature_url) # scraping image
  file = URI.open(href)
  years = rand(200..500)
  name = Faker::FunnyName.name
  creature = Creature.new(name: name, category: "Spirits", breed: creature,
                          super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
  creature.photo.attach(io: file, filename: 'creature.png', content_type: 'image/png')
  creature.save
  puts "Spirit created"
end

30.times { creating_beasts(hagrid, beasts_array) }
20.times { creating_beings(riddle, beings_array) }
10.times { creating_spirits(dumbledore, spirits_array) }
