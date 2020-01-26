class NicknameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :nickname, :total_score, :highest_score

  attribute :leaderboard_entries do |object|
    object.filtered_api_call(:leaderboard_entries, [:id, :score])
  end

end
