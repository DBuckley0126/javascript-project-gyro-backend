class CreateLeaderboardEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :leaderboard_entries do |t|
      t.references :nickname, foreign_key: true
      t.integer :score
      t.references

      t.timestamps
    end
  end
end
