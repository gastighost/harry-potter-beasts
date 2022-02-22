class CreateCreatures < ActiveRecord::Migration[6.1]
  def change
    create_table :creatures do |t|
      t.string :category
      t.string :breed
      t.string :super_power
      t.integer :needed_years_magic
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
