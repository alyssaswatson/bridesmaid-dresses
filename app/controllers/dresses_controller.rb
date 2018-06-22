class DressesController < ApplicationController

    def index
        @dresses = Dress.all
    end

    def new
        @dress = Dress.new
    end

    def create
        @dress = Dress.new(dress_params)
        if @dress.save
            redirect_to dress_path(@dress)
          else
            render :new
          end
    end

    def show
        @dress = Dress.find(params[:id])
    end

    def update
        if @dress.update(dress_params)
            redirect_to dress_path(@dress)
        else
            render :edit
        end
    end

    private
    
        def dress_params
          params.require(:dress).permit(:link, :material, :length)
        end

end
