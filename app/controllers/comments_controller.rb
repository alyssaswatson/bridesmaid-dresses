require 'byebug'

class CommentsController < ApplicationController
    
    def index
        byebug
		@dress = Dress.find(params[:landlord_id])
		@buildings = @landlord.buildings.all
		render json: @buildings
	end


end
