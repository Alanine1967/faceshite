class CreateMissives < ActiveRecord::Migration
  def change
    create_table :missives do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :missives, :title
  end
end
