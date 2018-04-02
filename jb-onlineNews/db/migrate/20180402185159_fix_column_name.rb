class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :titulo, :title
    rename_column :articles, :bajada, :subtitle
    rename_column :articles, :cuerpo, :body
  end
end
