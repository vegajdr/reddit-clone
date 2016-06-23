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

  def new
    @room = Room.new
    @user = current_user
    authorize @room
  end

  def create
    @room = Room.new(name: params[:room][:name], category: params[:room][:category])
    authorize @room
    if @room.save
      @room.moderators.create!(user_id: params[:room][:user])
      flash[:notice] = "Room created, you are now a moderator for this room"
      redirect_to rooms_path
    else
      render :index
    end

  end


end
