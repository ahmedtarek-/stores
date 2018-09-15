class CreateSpaces < ActiveRecord::Migration
  def up
    create_table :spaces, id: :uuid  do |t|
      t.string :title,   null: false, limit: 100
      t.float  :size,    null: false
      
      t.float  :price_per_day,    null: false
      t.float  :price_per_week,   null: false
      t.float  :price_per_month,  null: false

      t.references :store, type: :uuid, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end

  def down
    drop_table :spaces
  end
end