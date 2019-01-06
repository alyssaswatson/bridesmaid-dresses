require 'byebug'

class CommentsController < ApplicationController
    
    def index
		@dress = Dress.find(params[:dress_id])
        @comments = @dress.comments.all
        render json: @comments
	end


end
