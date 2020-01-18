class GameChannel < ApplicationCable::Channel
  def subscribed
    if params["mobile"] == true
      
        game = Game.find_by(join_code: params[:join_code])
      if game
        stream_from "game_channel_#{game.join_code}"
        ActionCable.server.broadcast(
          "game_channel_#{game.join_code}",
          action: "game_join_success",
          type: "alert",
          body: {message: "mobile controller successfully joined game #{game.join_code} and subscribed"}
        )
      else
        reject
      end
    else
      game = Game.new(join_code: params[:join_code])
      game.save
      stream_from "game_channel_#{game.join_code}"
      ActionCable.server.broadcast(
        "game_channel_#{game.join_code}",
        action: "game_create_success",
        type: "alert",
        body: {message: "successfully created game #{game.join_code} and subscribed"}
      )
    end

  end

  def unsubscribed

  end

  def data_relay(data)
      ActionCable.server.broadcast(
         "game_channel_#{params[:join_code]}",
         action: "data_relay",
         type: "broadcast",
         body: data["body"]
       )
  end

end