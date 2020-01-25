class GameChannel < ApplicationCable::Channel
  def subscribed
    if params["mobile"] == true
      
        game = Game.find_by(join_code: params[:join_code])
      if game
        stream_from "game_channel_#{game.join_code}"
        ActionCable.server.broadcast(
          "game_channel_#{game.join_code}",
          action: "game_join_success",
          type: "subscribed",
          body: {message: "mobile controller successfully joined game #{game.join_code} and subscribed"},
          channel: params[:join_code],
          mobile: params['mobile']
        )
      else
        reject
      end
    else
      reject if Game.find_by(join_code: params[:join_code])

      game = Game.new(join_code: params[:join_code])
      game.save
      stream_from "game_channel_#{game.join_code}"
      ActionCable.server.broadcast(
        "game_channel_#{game.join_code}",
        action: "game_create_success",
        type: "subscribed",
        body: {message: "successfully created game #{game.join_code} and subscribed"},
        channel: params[:join_code],
        mobile: params['mobile']
      )
    end

  end

  def unsubscribed(data={action:"unexpected_unsubscribe", type: "unsubscribed", body:{device: "unknown"}})
    ActionCable.server.broadcast(
      "game_channel_#{params[:join_code]}",
      action: data["action"],
      type: "unsubscribed",
      body: data["body"],
      channel: params[:join_code],
      mobile: params['mobile']
    )
  end

  def desktop_ping(data)
      ActionCable.server.broadcast(
         "game_channel_#{params[:join_code]}",
         action: data["action"],
         type: "desktop_ping",
         body: data["body"],
         channel: params[:join_code],
         mobile: params['mobile']
       )
  end

  def sensor_data_relay(data)
    ActionCable.server.broadcast(
      "game_channel_#{params[:join_code]}",
      action: data["action"],
      type: "sensor_data_relay",
      body: data["body"],
      channel: params[:join_code],
      mobile: params['mobile']
    )
  end

  def game_state(data)
    ActionCable.server.broadcast(
      "game_channel_#{params[:join_code]}",
      action: data["action"],
      type: "game_state",
      body: data["body"],
      channel: params[:join_code],
      mobile: params['mobile']
    )
  end

  def cancel_game(data)
    ActionCable.server.broadcast(
      "game_channel_#{params[:join_code]}",
      action: data["action"],
      type: "cancel_game",
      body: data["body"],
      channel: params[:join_code],
      mobile: params['mobile']
    )
  end

end