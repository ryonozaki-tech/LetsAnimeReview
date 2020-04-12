class GenresController < ApplicationController
  def show
    genre = Genre.find(params[:id])
    @g_name = genre.name
    @posts = genre.posts.order("created_at DESC")
    @genres = Genre.all
  end
end
