class LeaderboardEntriesController < ApplicationController
  def index
    all_leaderboard_entries = LeaderboardEntry.all
    all_leaderboard_entries.order('score DESC')
    render json: LeaderboardEntrySerializer.new(all_leaderboard_entries.order('score DESC')).serializable_hash
  end

  def create
    nickname = Nickname.find_or_create_by(nickname: params.require("nickname"))
    new_leaderboard_entry = LeaderboardEntry.create(nickname: nickname, score: params.require("score"))
    render json: LeaderboardEntrySerializer.new(new_leaderboard_entry).serializable_hash
  end

  def show
    leaderboard_entry = LeaderboardEntry.find(params.require("id"))
    render json: NicknameSerializer.new(leaderboard_entry.nickname).serializable_hash
  end
end
