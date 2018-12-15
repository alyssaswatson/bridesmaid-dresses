class DressesController < ApplicationController

    before_action :set_dresses

    def index
        @dresses = Dress.all
        render json: @dresses
    end

    def new
        @dress = Dress.new
    end

    def create
        @dress = Dress.new(dress_params)
        render json: @dress, status: 201
    end

    def edit 
        @dress = Dress.find(params[:id])
    end

    def show
        render json: @dress
    end

    def update
        @dress = Dress.update(dress_params)
        render json: @dress
    end

    def longest
        @dress = Dress.longest_dress.first
    end

    private

    def set_dresses
      @dress = Dress.find(params[:id])
    end
    
    def dress_params
      params.require(:dress).permit(:link, :material, :length)
    end

end
