class CommentPolicy < ApplicationPolicy

  def new
    # @comment = Comment.new
      # authorize @comment
    user.present?
  end

  def create?
    user.present?
  end
end
