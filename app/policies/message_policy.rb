class MessagePolicy < ApplicationPolicy

  def destroy?
    user == record.user
  end
end
