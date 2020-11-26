class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.new user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    @club = @room.club
    authorize @room_message
    if @room_message.save
      redirect_to club_room_path(@club, @room, anchor: "message-#{@room_message.id}")
      RoomChannel.broadcast_to(
        @room,
        render_to_string(partial: "messages", locals: { message: @room_message })
      )
    else
      render "rooms/show"
    end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
