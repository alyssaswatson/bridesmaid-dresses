class DressesController < ApplicationController

    def index
        @dresses = Dress.all
    end

    def new
        @dress = Dress.new
    end

    def create
        @dress = Dress.new
        @dress.link = params[:dress][:link]
        @dress.material = params[:dress][:material]
        @dress.length = params[:dress][:length]
        if @dress.save
            redirect_to dress_path(@dress)
          else
            render :new
          end
    end

    def show
        @dress = Dress.find(params[:id])
    end



end
