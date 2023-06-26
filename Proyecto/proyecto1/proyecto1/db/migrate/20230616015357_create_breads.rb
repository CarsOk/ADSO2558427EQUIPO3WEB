class CreateBreads < ActiveRecord::Migration[6.1]
  def change
    create_table :breads do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :precio

      t.timestamps
    end
  end
end
