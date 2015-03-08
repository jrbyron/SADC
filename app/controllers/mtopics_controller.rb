class MtopicsController < ApplicationController
  def index
    @mtopics = Mtopic.all.paginate(page: params[:page], per_page: 10)
    authorize @mtopics
  end

  def new
    @mtopic = Mtopic.new
    authorize @mtopic
  end

  def show
    @mtopic = Mtopic.find(params[:id])
    authorize @mtopic
    @mposts = @mtopic.mposts.includes(:user).includes(:mcomments).paginate(page: params[:page], per_page: 10)
  end

  def edit
    @mtopic = Mtopic.find(params[:id])
    authorize @mtopic
  end

  def create
    @mtopic = Mtopic.new(topic_params)
    authorize @mtopic
    if @mtopic.save
      redirect_to @mtopic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def update
    @mtopic = Mtopic.find(params[:id])
    authorize @mtopic
    if @mtopic.update_attributes(topic_params)
      redirect_to @mtopic
    else
      flash[:error] = "Error saving topic. Please try again"
      render :edit
    end
  end

  def destroy
    @mtopic = Mtopic.find(params[:id])
    name = @mtopic.name
    authorize @mtopic
    
    if @mtopic.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to mtopics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:mtopic).permit(:name, :description, :public)
  end
end