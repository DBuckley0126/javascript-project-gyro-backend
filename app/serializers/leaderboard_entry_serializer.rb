class LeaderboardEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :nickname, :score
end
