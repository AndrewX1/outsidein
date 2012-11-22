class RemoveArticleidFromArticle < ActiveRecord::Migration
  def up
    remove_column :articles, :article_id
  end

  def down
    add_column :articles, :article_id, :integer
  end
end
