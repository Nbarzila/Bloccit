class PostsController < ApplicationController

    def index
      @post = Post.all

    end

    def new
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
      @post = Post.new(params.require(:post).permit(:title, :body))
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
      if @post.update_attributes(params.require(:post).permit(:title, :body))
        redirect_to @post
      else
        flash[:error] = "Error saving post. Please try again."
        render :edit
      end
    end
  end
