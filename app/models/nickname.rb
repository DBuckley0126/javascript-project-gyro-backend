class Nickname < ApplicationRecord
  has_many :leaderboard_entries
  include ActiveRecordFilters

  # def total_score
  #   this.leaderboard_entries.score.all
  # end

  def highest_score
    sorted_all_scores = self.leaderboard_entries.order(score: :DESC)
    sorted_all_scores[0]
  end
end
