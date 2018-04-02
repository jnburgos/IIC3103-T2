class RemoveUpdatedAtFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :updated_at, :datetime
  end
end
