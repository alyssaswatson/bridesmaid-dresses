require 'byebug'

class CommentsController < ApplicationController
    
    def index
		@dress = Dress.find(params[:dress_id])
        @comments = @dress.comments.all
        render json: @comments
    end
    
    def create
        byebug
        @dress = Dress.find(params[:id])
        @comment = @dress.comments.build 
		@comment.update_attributes(comment_params)
		if @comment.save
			redirect_to dress_comment_path(@dress.comment, @comment)
		else 
			flash[:notice] = "The building couldn't be saved"
			redirect_to new_landlord_building_path(@dress)
		end
    end


end
