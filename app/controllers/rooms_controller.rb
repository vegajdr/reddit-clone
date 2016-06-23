class RoomsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find params[:id]
    authorize @room
    @messages = @room.messages
  end


end
