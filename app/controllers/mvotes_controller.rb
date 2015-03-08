class MvotesController < ApplicationController

  # before_action :load_post_and_vote

  # def up_vote
  #   update_vote!(1)
  #   redirect_to :back
  # end

  # def down_vote
  #   update_vote!(-1)
  #   redirect_to :back
  # end

  # private

  # def load_post_and_vote
  #   @mpost = Mpost.find(params[:mpost_id])
  #   @mvote = @mpost.mvotes.where(user_id: current_user.id).first
  # end

  # def update_vote!(new_value)
  #   if @mvote
  #     authorize @mvote, :update?
  #     @mvote.update_attribute(:value, new_value, mpost: @mpost)
  #   else
  #     @mvote = current_user.mvotes.build(value: new_value, mpost: @mpost)
  #     authorize @mvote, :create?
  #     @mvote.save
  #   end
  # end
end