class BookmarksController < ApplicationController
  
    before_action :set_bookmarks, only: :destroy

    def new
      @bookmark = Bookmark.new
      @list = List.find(params[:list_id])
    end

    def create
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new(bookmark_params)
        @bookmark.list = @list
        if @bookmark.save 
            redirect_to list_path(@list)
        else
            render :new
        end
    end

    def destroy
        @bookmark.destroy
    end
    private 

    def bookmark_params
        params.require(:bookmark).permit(:comment, :movie_id )
    end

    def set_bookmarks
        @bookmark = Bookmark.find(params[:id])
    end


end
