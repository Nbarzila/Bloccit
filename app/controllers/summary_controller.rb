class SummaryController < ApplicationController
  def index
    @summaries = Summary.all

  end

  def new
    @summary = Summary.new

  end

  def show
    @summary = Summary.find(params[:id])
    @posts = @summary.posts

  end

  def edit
    @summary = Summary.find(params[:id])

  end


    def create
      @summary = Summary.new(params.require(:topic).permit(:name, :description, :public))
      authorize @summary
      if @summary.save
        redirect_to @summary, notice: "Summary was saved successfully."
      else
        flash[:error] = "Error creating summary. Please try again."
        render :new
      end
    end

    def update
      @summary = Summary.find(params[:id])
      authorize @sumary
      if @summaryy.update_attributes(params.require(:topic).permit(:name, :description, :public))
        redirect_to @summary
      else
        flash[:error] = "Error saving summary. Please try again."
        render :edit
    end
  end
end
