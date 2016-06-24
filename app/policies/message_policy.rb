class MessagePolicy < ApplicationPolicy

  def destroy?
    (user == record.user && (DateTime.now.utc < record.created_at + 1.hour)) || is_moderator? || user.admin?
  end

  def new?
    create?
  end

  def create?
    true #if not subscribed to room?
  end

  def edit?
    update?
  end

  def update?
    (user == record.user) || is_moderator? || user.admin?
  end

  def is_moderator?
    record.room.moderators.find_by(user_id: user.id)
  end
end
