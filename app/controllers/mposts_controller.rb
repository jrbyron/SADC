class MpostsController < ApplicationController
  def index
    @mposts = Mpost.visible_to(current_user).where("mposts.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
  end
end