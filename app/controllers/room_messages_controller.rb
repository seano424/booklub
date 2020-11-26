class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    @club = @room.club

    RoomChannel.broadcast_to(
      [@club, @room],
      render_to_string(partial: "message", locals: { message: @room_message })
     )
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
