class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.post = @post
    if @comment.save
      redirect_to [ @post.topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "Error creating comment. Please try again."
      render :new
    end
  end

  def destroy
   @comment = @post.comments.find(params[:id])

    if @comment.destroy
     flash[:notice] = "Comment was removed."
     redirect_to [@post.topic, @post]
    else
     flash[:error] = "Comment could not be deleted. Try again."
     redirect_to [@post.topic, @post]
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)

  end
end
