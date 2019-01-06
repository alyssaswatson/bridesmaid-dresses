require 'byebug'

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

    def edit 
        @dress = Dress.find(params[:id])
    end

    def show
        @dress = Dress.find(params[:id])
        byebug
    end

    def update
        @dress = Dress.find(params[:id])
        if @dress.update(dress_params)
            redirect_to dress_path(@dress)
        else
            render :edit
        end
    end

    def longest
        @dress = Dress.longest_dress.first
    end

    private
    
        def dress_params
          params.require(:dress).permit(:link, :material, :length)
        end

end
