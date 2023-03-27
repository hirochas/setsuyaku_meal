class CreateResipes < ActiveRecord::Migration[6.1]
  def change
    create_table :resipes do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.integer :cost, null: false
      t.string :item, null: false
      t.text :how_to_cook, null: false
      t.integer :genre_id, null: false
      t.timestamps
    end
  end
end
