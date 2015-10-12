class CommentsController < ApplicationController

  def create
    # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
      authorize @comment
    if @comment.save
      redirect_to [@post.topic, @post], notice: "Comment was saved successfully."
    else
      redirect_to [@post, @comment], notice: "Error creating comment. Please try again."
    end
  end

  private

  def comment_params

    params.require(:comment).permit(:body)

  end

end
