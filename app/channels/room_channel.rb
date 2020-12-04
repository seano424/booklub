class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:id])
    # stream_for room
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast("chat_#{params[:room]}", data)
  end
end
