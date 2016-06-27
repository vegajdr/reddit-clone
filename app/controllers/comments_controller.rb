class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    comment = current_user.comments.create!
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
