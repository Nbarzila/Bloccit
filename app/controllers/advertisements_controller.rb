class AdvertisementsController < ApplicationController
  def index
    @advertisements = Post.all
  end

  def show
    @advertisements = Advertisements.find(params[:id])
  end
end
