class MessagesController < ApplicationController
  skip_after_action :verify_authorized, only: [:vote]

  def index
    @messages = current_user.messages
  end

  def create
    user = current_user
    room = Room.find params[:room_id]
    @message = user.messages.new(title: params[:message][:title], text: params[:message][:text], room_id: params[:room_id])
    authorize @message
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
    authorize @message
  end

  def destroy
    message = Message.find params[:id]
    authorize message
    message.destroy
    redirect_to room_path(params[:room_id])
  end

  def edit
    @message = Message.find params[:id]
    authorize @message

  end

  def update
    @message = Message.find params[:id]
    authorize @message
    if @message.update approved_params
      flash[:notice] = "Message Updated"
      redirect_to @message.room
    else
      render :edit
    end
  end

  def vote
    vote = current_user.votes.find_by(message_id: params[:message_id])
    if vote
      case params[:vote]
      when "up"
        vote.update(vote: 1)
      when "down"
        vote.update(vote: -1)
      end
    else
      case params[:vote]
      when "up"
        Vote.create(user_id: current_user.id, message_id: params[:message_id], vote: 1)
      when "down"
        Vote.create(user_id: current_user.id, message_id: params[:message_id], vote: -1)
      end#New Vote creation
    end
    redirect_to room_path(params[:room_id])
  end


  private

    def approved_params
      params.require(:message).permit(:title, :text,)
    end

end
