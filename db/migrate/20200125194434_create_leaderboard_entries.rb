class CreateLeaderboardEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :leaderboard_entries do |t|
      t.string :nickname_id, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
