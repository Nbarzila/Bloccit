class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post =@topic.posts.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
      aurhorize @comment
    if @comment.save
      redirect_to [@post, @comment], notice: "Comment was saved successfully."
    else
      redirect_to [@post, @comment], notice: "Error creating comment. Please try again."
    end
  end

  private

  def comment_params

    params.require(:comment).permit(:body)

  end

end
