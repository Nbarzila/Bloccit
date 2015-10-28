class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    @post.user_id = current_user.id
    authorize favorite
    if favorite.save
      flash[:notice] = "Thank you for your favorite"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Unable to save favorite action"
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite =current_user.favorites.find(params[:id])
    authorize @favorite
    puts @favorite
    if @favorite.destroy
      flash[:notice] = "Sucess"
      redirect_to [@post.topic, @post]
      # Flash success and redirect to @post
    else
      flash[:error] = "Error, can't unfavorite"
      # Flash error and redirect to @post
      redirect_to [@post.topic, @post]
    end
  end
end
