class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku_id, index: true, unique: true
      t.decimal :price, precision: 15, scale: 10
      t.text :description
      t.text :categories, array: true, default: []
      t.text :tags, array: true, default: []
      t.json :images, default: {}
      t.datetime :expire_date
      t.boolean :admin_approved
      t.timestamps null: false
    end
  end
end
