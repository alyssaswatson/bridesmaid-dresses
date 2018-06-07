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
    end


end
