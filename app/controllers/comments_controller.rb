require 'byebug'

class CommentsController < ApplicationController
    
    def index
		@dress = Dress.find(params[:dress_id])
        @comments = @dress.comments.all
        render json: @comments
    end

    def new
        @dress = Dress.find(params[:dress_id])
        @comment = Comment.new
        @url = new_dress_comment_path(@dress)
        
        respond_to do |format|
            format.html {redirect_to @dress}
            format.js
        end

    end
    
    def create 
        @dress = Dress.find(params[:dress_id])
        @comment = @dress.comments.new(comment_params)
        if @comment.save
            respond_to do |format|
                format.html {redirect_to @dress}
                format.js
            end
		else 
			flash[:notice] = "This couldn't be saved"
			redirect_to new_dress_comment_path(@dress)
		end
	end

    def show
        #byebug
		@comment= Comment.find(params[:id])
	end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    end

private

    def comment_params
		params.require(:comment).permit(:dress_id, :comment)
	end


end
