class NicknameSerializer
  include FastJsonapi::ObjectSerializer
  has_many :leaderboard_entries
  attributes :nickname

  attribute :leaderboard_entries do |object|
    object.filtered_api_call(:leaderboard_entries, [:id, :score])
  end

end
