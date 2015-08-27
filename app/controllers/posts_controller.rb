class PostsController < ApplicationController
  # before_action :flash_attack
  skip_before_action :flash_attack, only: [:index, :new]


  def index
    @post = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def new
     @topic = Topic.find(params[:topic_id])
     @post = Post.new
  end

  def create
   @topic = Topic.find(params[:topic_id])
   @post = Post.new(params.require(:post).permit(:title, :body))
   @post.user = current_user
   @post.topic = @topic
   authorize @post
   if @post.save
     flash[:notice] = "Post was saved."
     redirect_to [@topic, @post]
     redirect_to @post
   else
     flash[:error] = "There was an error saving the post. Please try again."
     render :new
   end
end

    def edit
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
   end

   def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post

     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
end
