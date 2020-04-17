class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :show]

  def index
    @genres = Genre.all
    @posts = Post.all.includes(:user).order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
    # @users = User.all
  end

  def new
    @post = Post.new
    # @genres = Genre.all
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    # @post.create
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
    # binding.pry
    post.destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
    @genres = Genre.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :rate, :image, :review, genre_ids: []).merge(user_id: current_user.id)
    # params.permit(:rate)
  end

  # def post_rate_params
  #   params.permit(:rate)
    # { rate: params[:rate]}
    # { shipping_method_id: params[:shipping_method_id]}
  # end

  def set_post
    @post = Post.find(params[:id])
  end
end

# , genre_posts_id: genre.id
# , :post[genre_id][]
