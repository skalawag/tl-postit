class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes_tables do |t|
      t.boolean :vote
      t.integer :user_id
      t.string :votable_type
      t.integer :votable_id
      t.timestamps
    end
  end
end
