class AddFirstNameAndSurnameToUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :surname, :string
  	add_index :users, [:first_name, :surname]
  end
end
