class CommentsController < ApplicationController

  def new
     @post = Post.find(params[:post_id])
     @comment = Comment.new
        authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
      authorize @comment
    if @comment.save
      redirect_to [@post.topic, @post], notice: "Comment was saved successfully."
    else
      redirect_to [@post, @comment], notice: "Error creating comment. Please try again."
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

      authorize @comment
    if @comment.destroy
     flash[:notice] = "Comment was removed."
     redirect_to [@post.topic, @post]
    else
     flash[:error] = "There was an error deleting your comment. Please try again."
     redirect_to [@post.topic, @post]
   end
 end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
