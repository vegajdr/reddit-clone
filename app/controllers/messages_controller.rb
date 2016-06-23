class MessagesController < ApplicationController

  def index
    @messages = current_user.messages
  end

  def create
    user = current_user
    room = Room.find params[:message][:room_id]
    @message = user.messages.new(title: params[:message][:title], text: params[:message][:text], room_id: params[:room_id])
    if @message.save
      flash[:notice] = "Message created!"
      redirect_to room_path(room.id)
    else
      render :new
    end
  end

  def new
    user = current_user
    @message = user.messages.new
  end

  private

    def approved_params
      params.require(:message).permit(:title, :text, :room_id)
    end

end
