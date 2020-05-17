class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:new, :edit]

  def index
    @genres = Genre.all
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @genres = Genre.all
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to :back
  end

  def search
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(10)
    @genres = Genre.all
  end

  def star_ranking
    @genres = Genre.all
    @posts = Post.all.includes(:user).order("rate DESC").page(params[:page]).per(10)
  end

  def like_ranking
    @genres = Genre.all
    @posts = Post.all.includes(:user).order("likes_count DESC").page(params[:page]).per(10)
  end

  private

  def post_params
    params.require(:post).permit(:title, :rate, :image, :review, genre_ids: []).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
