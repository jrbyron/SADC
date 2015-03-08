class Mtopics::MpostsController < ApplicationController
  def show
    @mtopic = Mtopic.find(params[:mtopic_id])
    @mpost = Mpost.find(params[:id])
    @mcomments = @mpost.mcomments
    authorize @mtopic
  end

  def new
    @mtopic = Mtopic.find(params[:mtopic_id])
    @mpost = Mpost.new
    authorize @mpost
  end

  def edit
    @mtopic = Mtopic.find(params[:mtopic_id])
    @mpost = Mpost.find(params[:id])
    authorize @mpost
  end
  
  def create
    @mtopic = Mtopic.find(params[:mtopic_id])
    @mpost = current_user.mposts.build(post_params)
    @mpost.mtopic = @mtopic
    authorize @mpost

    if @mpost.save
      @mpost.create_vote
      flash[:notice] = "Post was saved."
      redirect_to [@mtopic, @mpost]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  def update
    @mtopic = Mtopic.find(params[:mtopic_id])
    @mpost = Mpost.find(params[:id])
    authorize @mpost

    if @mpost.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@mtopic, @mpost]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def destroy
    @mtopic = Mtopic.find(params[:mtopic_id])
    @mpost = Mpost.find(params[:id])
    title = @mpost.title
    authorize @mpost

    if @mpost.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @mtopic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end
  
  private

  def post_params
    params.require(:mpost).permit(:title, :body, :image)
  end
end