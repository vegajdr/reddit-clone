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
    record.moderators.find_by(user_id: user.id) || user.admin?
  end
end
