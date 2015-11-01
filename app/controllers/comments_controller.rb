class CommentsController < ApplicationController

  def create
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


  def new
     @post = Post.find(params[:post_id])
     @comment = Comment.new
        authorize @comment
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
      authorize @comment
   if @comment.destroy
     flash[:notice] = "Comment was removed."
   else
     flash[:error] = "Comment could not be deleted. Try again."
   end
   
   respond_to do |format|
      format.html
      format.js
    end
 end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
