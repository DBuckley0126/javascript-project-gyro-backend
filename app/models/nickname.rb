class Nickname < ApplicationRecord
  has_many :leaderboard_entries
  include ActiveRecordFilters

  def total_score
    this.leaderboard_entries.score.all
  end

  # def highest_score
  #   all_scores = this.leaderboard_entries.score.all
  #   allscores.sort()
  # end
end
