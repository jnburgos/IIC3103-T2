class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.string :bajada
      t.string :cuerpo
      t.datetime :fecha

      t.timestamps
    end
  end
end
