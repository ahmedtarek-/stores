class CreateStores < ActiveRecord::Migration
  def up
    create_table :stores, id: :uuid  do |t|
      t.string :title,   null: false, limit: 100
      t.string :city,    null: false
      t.string :street,  null: false

      t.integer :spaces_counts, default: 0
      
      t.timestamps null: false
    end
  end

  def down
    drop_table :stores
  end
end