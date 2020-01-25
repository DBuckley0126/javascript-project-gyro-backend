class Nickname < ApplicationRecord
  has_many :leaderboard_entries
  include ActiveRecordFilters
end
