class RoomPolicy < ApplicationPolicy

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    user == room.moderators.find_by(user_id: user.id).user
  end
end
