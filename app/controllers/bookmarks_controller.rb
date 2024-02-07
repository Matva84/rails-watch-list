class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    raise
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    bookmark = Bookmark.new(movie: @movie, list: @list, comment: @comment)
    bookmark.save
  end

private

  def bookmark_params
    permit.require(:bookmark).params(:list_id)
  end
end
