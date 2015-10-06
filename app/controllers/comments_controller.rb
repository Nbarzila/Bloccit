class CommentsController < ApplicationController


  def create
    @topic = Topic.find(params[:topic_id])
    @post =@topic.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment = @comments.post.find(params[:id])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to [@post, @comment], notice: "Comment was saved successfully."
    else
      flash[:error] = "Error creating comment. Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment could not be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end