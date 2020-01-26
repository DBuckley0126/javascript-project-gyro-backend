class LeaderboardEntry < ApplicationRecord
  belongs_to :nickname

  def date
    Date.parse(self.created_at.to_s).strftime("%m/%d/%Y")
  end
end
