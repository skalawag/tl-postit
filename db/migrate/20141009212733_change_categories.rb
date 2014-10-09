class ChangeCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.rename :name, :category
    end
  end
end
