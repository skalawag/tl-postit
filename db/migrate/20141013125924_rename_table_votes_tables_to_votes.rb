class RenameTableVotesTablesToVotes < ActiveRecord::Migration
  def change
    rename_table :votes_tables, :votes
  end
end
