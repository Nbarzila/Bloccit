class PostPolicy < ApplicationPolicy


def new
    @post = Post.new
    authorize @post
end

def index?
   true
 end
end 
