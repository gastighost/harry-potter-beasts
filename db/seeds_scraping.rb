# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "nokogiri"

# Creating an array of beasts
url = "https://harrypotter.fandom.com/wiki/List_of_creatures"
html = URI.open(url)
doc = Nokogiri::HTML(html)

wanted_ul = doc.css("#mw-content-text .mw-parser-output ul")[22]
elements = wanted_ul.search("li > a")

beasts = []
elements.each do |element|
  beasts << element.text.strip
end
puts beasts

# #Getting the image of the beasts
# def scraping_img(beasts)
#   begin
#     beast = beasts.sample.tr_s(" ", "_")
#     url = "https://harrypotter.fandom.com/wiki/#{beast}"

#     html = URI.open(url)
#     doc = Nokogiri::HTML(html)

#     element = doc.search("aside figure a")
#     href =  element.attribute("href").value
#     puts href
#   rescue => exception
#     href = "https://s7g8.scene7.com/is/image/BradfordUK/0302984001_alt1?wid=700&hei=700&fmt=pjpeg&qlt=85,0"
#     puts href
#   end
# end

# scraping_img(beasts)
