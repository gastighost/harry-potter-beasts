class AddNametoCreatures < ActiveRecord::Migration[6.1]
  def change
    add_column :creatures, :name, :string
  end
end
