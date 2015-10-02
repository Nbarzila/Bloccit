class CommentsController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to [@post, @comment], notice: "Comment was saved successfully."
    else
      flash[:error] = "Error creating comment. Please try again."
      render :new
    end
  end
    def destroy
   @comment = @post.comments.find(params[:id])

   authorize @comment
   if @comment.destroy
     flash[:notice] = "Comment was removed."
     redirect_to [@post]
   else
     flash[:error] = "Comment could not be deleted. Try again."
     redirect_to [@post]
   end
  end
  end

  private

  def comment_params

    params.require(:comment).permit(:body)

  end

end
