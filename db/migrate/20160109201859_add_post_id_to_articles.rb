class AddPostIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :post_id, :string, null: false
  end
end
