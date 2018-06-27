class SessionsController < ApplicationController
    
      def destroy
        session[:bride_id] = nil
        redirect_to root_url
      end
    
      def new
        @bride = Bride.new
        @brides = Bride.all
      end
    
      def create
        @bride = Bride.find_by(name: params[:bride][:name])
        if @bride && @bride.authenticate(params[:bride][:password])
          session[:bride_id] = @bride.id
          redirect_to bride_path(@bride)
        else
          redirect_to signin_path
        end
      end
    
    end