class PostPolicy < ApplicationPolicy


  def new
    create?
  end

  def index?
    true
  end

  def destroy?
     user.present? && (record.user == user || user.admin? || user.moderator?)
   end
end
