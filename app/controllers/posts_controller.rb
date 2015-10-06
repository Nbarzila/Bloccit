class PostsController < ApplicationController

  def index
    @post = Post.all

  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def show

    @post = Post.find(params[:id])
    authorize @post
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    authorize @post
    if @post.save
      redirect_to @post, notice: "Post was saved successfully."
    else
      flash[:error] = "Error creating post. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      flash[:error] = "Error saving post. Please try again."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)

  end
end
