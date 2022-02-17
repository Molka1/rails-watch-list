class ListsController < ApplicationController

    before_action :set_lists, only: [:show, :edit, :update]

    def index
      @lists = List.all
    end

    def show
      @bookmark = Bookmark.new
    end

    def new
        @list = List.new
      end

    def create
        @list = List.create(lists_params)
        if @list.save 
            redirect_to list_path(@list)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @list.update(lists_params)
    end

    def destroy
        @list.destroy
    end

    private
    def lists_params
        params.require(:list).permit(:name)
    end

    def set_lists
        @list = List.find(params[:id])
    end
end
