class SummariesController < ApplicationController
  def index
    @summaries = Summary.all


  end

  def new
    @summary = Summary.new


  end

  def show
    @summary = Summary.find(params[:id])
    @posts = @posts.summary

  end

  def edit
    @summary = Summary.find(params[:id])
    authorize @summary

  end


  def create
    @summary = Summary.new(summary_params)
    if @summary.save
      redirect_to @summary, notice: "Summary was saved successfully."
    else
      flash[:error] = "Error creating summary. Please try again."
      render :new
    end
  end

  def update
    @summary = Summary.find(params[:id])
    if @summary.update_attributes(summary_params)
      redirect_to @summary
    else
      flash[:error] = "Error saving summary. Please try again."
      render :edit
    end
  end

  private

  def summary_params
    params.require(:summary).permit(:body)
  end
end
