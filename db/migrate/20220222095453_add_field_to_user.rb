class AddFieldToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :hogwarts_house, :string
    add_column :users, :years_of_magic, :integer
    add_column :users, :owner, :boolean
    add_column :users, :dark_magic, :boolean
  end
end
