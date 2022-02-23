# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

Creature.destroy_all
puts "Destroying all creatures"
User.destroy_all
puts "Destroying all users"

dumbledore = User.create!(name: "Albus Percival Wulfric Brian Dumbledore", email: "albus@gmail.com", password: "123456",
                         hogwarts_house: "gryffindor", years_of_magic: 732, owner: true, dark_magic: false)

# Creating Beasts
def creating_beasts(user)
  beasts = ["Acromantula", "Alizor of Westacottus", "Antipodean Opaleye", "Catalonian Fireball", "Chinese Fireball",
            "Common Welsh Green", "Hebridean Black", "Hungarian Horntail", "Norwegian Ridgeback", "Peruvian Vipertooth",
            "Portuguese Long-Snout", "Romanian Longhorn", "Swedish Short-Snout", "Ukrainian Ironbelly"].sample
  years = rand(1..350)
  file = URI.open('https://images.ctfassets.net/usf1vwtuqyxm/3C3YOcwXaUFwUHSty4tarh/7bc44aacdc662190f7fa2a616308e844/HP-F4-goblet-of-fire-dragon-first-task-triwizard-tournament-hungarian-horntail-web-landscape?w=1200&fit=fill&f=top')
  creature = Faker::Movies::HarryPotter.character
  creature = Creature.new(name: creature, category: "Beasts", breed: beasts,
                          super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
  creature.photo.attach(io: file, filename: 'creature.png', content_type: 'image/png')
  creature.save
end

def creating_beings(user)
  beings = ["Giant", "Goblin", "Hag", "Part-elf", "Part-giant",
            "Part-goblin", "House-Elf", "Pukwudgie", "Troll", "Vampire",
            "Veela", "Werewolf", "Half-Breed"].sample
  years = rand(1..350)
  file = URI.open('https://cdna.artstation.com/p/assets/images/images/000/189/344/large/andrei-riabovitchev-gi-l-face-05d.jpg?1409666167')
  creature = Faker::Movies::HarryPotter.character
  creature = Creature.new(name: creature, category: "Beings", breed: beings,
                          super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
  creature.photo.attach(io: file, filename: 'creature.png', content_type: 'image/png')
  creature.save
end

def creating_spirits(user)
  spirits = ["Banshee", "Ghost", "Gytrash", "Phantom Rat", "Giant Phantom Rat",
             "Spectre Bat", "Boggart", "Dementor", "Poltergeist"].sample
  years = rand(1..350)
  file = URI.open('https://static.wikia.nocookie.net/harrypotter/images/b/b8/Myrtle_Warren_profile.png/revision/latest?cb=20170113020338')
  creature = Faker::Movies::HarryPotter.character
  creature = Creature.new(name: creature, category: "Spirits", breed: spirits,
                          super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
  creature.photo.attach(io: file, filename: 'creature.png', content_type: 'image/png')
  creature.save
end

10.times { creating_beasts(dumbledore) }
10.times { creating_beings(dumbledore) }
10.times { creating_spirits(dumbledore) }
