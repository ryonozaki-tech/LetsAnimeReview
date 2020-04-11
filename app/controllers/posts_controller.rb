class PostsController < ApplicationController
  def index
    @genres = Genre.all
    @posts = Post.all.order("created_at DESC")
    # @users = User.all
  end

  def new
    @post = Post.new
    # @genres = Genre.all
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    # Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :review, genre_ids: []).merge(user_id: current_user.id)
  end
end

# , genre_posts_id: genre.id
# , :post[genre_id][]
