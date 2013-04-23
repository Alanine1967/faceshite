class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships, force: true do |t|
      t.integer :user_id, null: false
      t.integer :acquaintance_id, null: false

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :acquaintance_id
  end
end
