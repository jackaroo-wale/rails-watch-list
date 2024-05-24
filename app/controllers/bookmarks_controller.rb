class BookmarksController < ApplicationController
  def new
    @movies = Movie.all
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save!
      redirect_to lists_path
    else
      raise
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movies_id, :lists_id)
  end

  def destroy
    @bookmark = bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end
end
