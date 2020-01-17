class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "game_channel#{params[:token]}"
    stream_from "game_channel"
  end

  def unsubscribed

  end

  def button_pressed(data)

    if data["body"]["button_pressed"] == true
      socket = {button_pressed: true}
      
      ActionCable.server.broadcast(
         "game_channel",
         body: {coor: data["body"]["coor"]}
       )
    end
  end

end