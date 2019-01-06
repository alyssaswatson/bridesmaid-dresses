require 'byebug'

class CommentsController < ApplicationController
    
    def index
		@dress = Dress.find(params[:dress_id])
        @comments = @dress.comments.all
        render json: @comments
    end
    
    def create
        
        @dress = Dress.find(params[:dress_id])
        @comment = @dress.comments.build 
        #byebug
		@comment.update_attributes(comment_params)
		if @comment.save
			redirect_to dress_comment_path(@dress.comment, @comment)
		else 
			flash[:notice] = "The building couldn't be saved"
		end
    end

private

	def comment_params
		params.require(:comment).permit(:dress_id)
	end


end
