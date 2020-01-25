class LeaderboardEntriesController < ApplicationController
  def show
    # game_press = params.require("message")

    # render json: {press: game_press}
    render json: LeadeerboardEntrySerializer.new()
  end

  def create

  end
end
