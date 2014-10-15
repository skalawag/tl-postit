class RemoveSlugFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :slug
  end
end
