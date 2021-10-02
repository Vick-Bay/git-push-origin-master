class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]
    # show all bookmarks
    def index
        @bookmarks = Bookmark.all
    end

  def show
    @bookmark = Bookmark.find(params[:id])
    @bookmark = Bookmark.new
  end

    # create a new bookmark
  def new
      @bookmark = Bookmark.new # needed to instantiate the form_for
  end

  def create
      @bookmark = Bookmark.new(bookmark_params)
      @bookmark.list = @list
      @bookmark.save
    if @bookmark.save
        redirect_to list_path(@list)
      else
        render :new
      end
  end

    # delete a bookmark
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    # no need for app/views/bookmarks/destroy.html.erb
    redirect_to bookmarks_path
  end

    private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

    def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
