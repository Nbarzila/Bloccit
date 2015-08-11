class PostPolicy < ApplicationPolicy


def new
    @post = Post.new
    authorize @post
end

def index?
   true
end

def show?
 scope.where (user.moderator || user.admin || record.user == user)
end

class Scope
  attr_reader :user, :scope

  def initialize(user, scope)
    @user = user
    @scope = scope
end

def resolve
  scope
end
end
