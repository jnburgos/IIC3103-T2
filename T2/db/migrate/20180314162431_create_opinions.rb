class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.string :autor
      t.string :cuerpo
      t.integer :post_id

      t.timestamps
    end
  end
end
