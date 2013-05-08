class AddReceipientToMissive < ActiveRecord::Migration
  def change
  	add_column :missives, :recipient, :integer
  end
end
