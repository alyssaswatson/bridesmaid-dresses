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
			redirect_to dress_comment_path(@dress.comments, @comment)
		else 
			flash[:notice] = "The comment could not be saved"
		end
    end

    def show
        #byebug
		@comment= Comment.find(params[:id])
	end
	

private

	def comment_params
		params.require(:comment).permit(:dress_id)
	end


end
