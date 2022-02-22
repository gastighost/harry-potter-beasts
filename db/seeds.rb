# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Creature.destroy_all
User.destroy_all

dumbledore = User.create!(name: "Albus Percival Wulfric Brian Dumbledore", email: "albus@gmail.com", password: "123456",
                         hogwarts_house: "gryffindor", years_of_magic: 732, owner: true, dark_magic: false)

# Creating Beasts
def creating_beasts(user)
  beasts = ["Acromantula", "Alizor of Westacottus", "Antipodean Opaleye", "Catalonian Fireball", "Chinese Fireball",
            "Common Welsh Green", "Hebridean Black", "Hungarian Horntail", "Norwegian Ridgeback", "Peruvian Vipertooth",
            "Portuguese Long-Snout", "Romanian Longhorn", "Swedish Short-Snout", "Ukrainian Ironbelly"].sample
  years = rand(1..350)
  Creature.create!(category: "Beasts", breed: beasts,
                   super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
end

def creating_beings(user)
  beings = ["Giant", "Goblin", "Hag", "Part-elf", "Part-giant",
            "Part-goblin", "House-Elf", "Pukwudgie", "Troll", "Vampire",
            "Veela", "Werewolf", "Half-Breed"].sample
  years = rand(1..350)
  Creature.create!(category: "Beings", breed: beings,
                   super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
end

def creating_spirits(user)
  spirits = ["Banshee", "Ghost", "Gytrash", "Phantom Rat", "Giant Phantom Rat",
             "Spectre Bat", "Boggart", "Dementor", "Poltergeist"].sample
  years = rand(1..350)
  Creature.create!(category: "Spirits", breed: spirits,
                   super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years, user: user)
end

10.times { creating_beasts(dumbledore) }
10.times { creating_beings(dumbledore) }
10.times { creating_spirits(dumbledore) }
