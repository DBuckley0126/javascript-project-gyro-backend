class LeaderboardEntrySerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :nickname
  attributes :nickname, :score

end
