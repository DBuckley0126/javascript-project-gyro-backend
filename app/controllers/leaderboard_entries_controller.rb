class LeaderboardEntriesController < ApplicationController
  def show
    # game_press = params.require("message")
    # nickname = Nickname.create({nickname: "Smurf"})
    # LeaderboardEntry.create({nickname: nickname, score: 12094})
    # LeaderboardEntry.create({nickname: nickname, score: 51394})
    # LeaderboardEntry.create({nickname: nickname, score: 2094})
    # nickname2 = Nickname.create({nickname: "Kalirae"})
    # LeaderboardEntry.create({nickname: nickname2, score: 294})
    # LeaderboardEntry.create({nickname: nickname2, score: 209784})

    # render json: {press: game_press}
    all_leaderboard_entries = LeaderboardEntry.all
    all_leaderboard_entries.order('score DESC')
    render json: LeaderboardEntrySerializer.new(all_leaderboard_entries.order('score DESC')).serializable_hash
  end

  def create
    nickname = Nickname.find_or_create_by(nickname: params.require("nickname"))
    new_leaderboard_entry = LeaderboardEntry.create(nickname: nickname, score: params.require("score"))
    render json: LeaderboardEntrySerializer.new(new_leaderboard_entry).serializable_hash
  end
end
