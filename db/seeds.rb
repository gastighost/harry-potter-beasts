# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Creating Beasts
def creating_beasts
  beasts = ["Acromantula", "Alizor of Westacottus", "Antipodean Opaleye", "Catalonian Fireball", "Chinese Fireball",
          "Common Welsh Green", "Hebridean Black", "Hungarian Horntail", "Norwegian Ridgeback", "Peruvian Vipertooth",
          "Portuguese Long-Snout", "Romanian Longhorn", "Swedish Short-Snout", "Ukrainian Ironbelly", "Water dragon"].sample
  years = rand(1..350)
  Creature.new(category: "Beasts", breed: beasts, super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years )
end

def creating_beings
  beings = ["Giant", "Goblin", "Hag", "Part-elf", "Part-giant",
          "Part-goblin", "House-Elf", "Pukwudgie", "Troll", "Vampire",
          "Veela", "Werewolf", "Half-Breed"].sample
  years = rand(1..350)
  Creature.new(category: "Beings", breed: beings, super_power: Faker::Movies::HarryPotter.spell, needed_years_magic: years )
end


10.times creating_beasts
10.times creating_beings
