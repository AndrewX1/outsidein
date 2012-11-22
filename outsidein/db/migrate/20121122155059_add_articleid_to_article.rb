class AddArticleidToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :article_id, :integer
  end
end
