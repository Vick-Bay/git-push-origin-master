class ListsController < ApplicationController
    # show all lists
    def index
        @lists = List.all
    end

    # show one specific list
    def show
        @list = List.find(params[:id])
    end

    def new
        @list = List.new # needed to instantiate the form_for
    end

    def create
        @list = List.new(list_params)
        @list.save

        # no need for app/views/lists/create.html.erb
        redirect_to list_path(@list)
    end

    private

    def list_params
        params.require(:list).permit(:name)
    end

end
