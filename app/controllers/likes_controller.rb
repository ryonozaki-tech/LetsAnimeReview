class LikesController < ApplicationController

  # before_action :set_post
  def create
    like = current_user.likes.build(post_id: params[:post_id])
    like.save
    redirect_to :back
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    redirect_to :back
  end

  # def show
  #   user = User.find(params[:id])
  #   like = Like.where(user_id: current_user.id, post_id: params[:post_id])
  #   @likes = likes.where(user_id: user_id)
  #   @post = like.posts()
  # end
end 
