class DressesController < ApplicationController

    def index
        @dresses = Dress.all
    end

    def new
        @dress = Dress.new
    end


end
