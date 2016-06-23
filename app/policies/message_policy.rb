class MessagePolicy < ApplicationPolicy

  def destroy?
    user == record.user && (DateTime.now.utc < record.created_at + 1.hour)
  end

  def new?
    create?
  end

  def create?
    true
  end
end
