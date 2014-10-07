class RemoveColumnFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :user_id
    remove_column :categories, :post_id
  end
end
