class GenresController < ApplicationController

  def show
    genre = Genre.find(params[:id])
    @g_name = genre.name
    @posts = genre.posts.order("created_at DESC")
    @genres = Genre.all
  end

  def each_genre_ranking
    genre = Genre.find(params[:id])
    @g_name = genre.name
    @posts = genre.posts.order("rate DESC")
    @genres = Genre.all
  end

end
