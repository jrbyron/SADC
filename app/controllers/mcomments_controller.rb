class McommentsController < ApplicationController
  
  def create
    @mpost = Mpost.find(params[:mpost_id])
    @mcomment = @mpost.mcomments.new(comment_params)
    @mcomment.user_id = current_user.id

    if @mcomment.save
      redirect_to [@mpost.mtopic, @mpost], notice: "Comment saved successfully."
    else
      redirect_to [@mpost.mtopic, @mpost], notice: "Comment failed to save."
    end
  end

  def destroy
    @mpost = Mpost.find(params[:mpost_id])
    @mcomment = @mpost.mcomments.find(params[:id])
    authorize @mcomment

    if @mcomment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def comment_params
    params.require(:mcomment).permit(:body)
  end

end