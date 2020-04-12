class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @posts = user.posts.order("created_at DESC")
    @genres = Genre.all
    # .page(params[:page]).per(5).order("created_at DESC")
  end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)    
  end
end
