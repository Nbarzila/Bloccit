class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Thank you for your favorite"
      # Add code to generate a success flash and redirect to post
      redirect_to [@post.topic, post]
      # Remember the path shortcut: [post.topic, post]
    else
      flash[:error] = "Unable to save favorite action"
      redirect_to [@post.topic, @post]
      # Add code to generate a failure flash and redirect to post
    end
  end
end
