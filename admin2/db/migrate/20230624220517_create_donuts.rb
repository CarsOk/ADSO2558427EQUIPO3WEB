class CreateDonuts < ActiveRecord::Migration[6.0]
  def change
    create_table :donuts do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
