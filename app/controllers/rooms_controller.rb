class RoomsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find params[:id]
    @vote = Vote.new
    authorize @room
    @moderator = @room.moderators.find_by(user_id: current_user.id)
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

  def edit
    @room = Room.find params[:id]
    authorize @room
  end

  def update

  end

  # def is_moderator? user
  #   room.moderators.find_by(user_id: user.id)
  # end


end
