class LeaderboardEntriesController < ApplicationController
  def show
    # game_press = params.require("message")

    # render json: {press: game_press}
    all_leaderboard_entries = LeaderboardEntry.all
    render json: LeaderboardEntrySerializer.new(all_leaderboard_entries).serializable_hash
  end

  def create
    nickname = Nickname.find_or_create_by(nickname: params.require("nickname"))

    new_leaderboard_entry = LeaderboardEntry.new(nickname: nickname)
    render json: LeaderboardEntrySerializer.new(new_leaderboard_entry).serializable_hash
  end
end
