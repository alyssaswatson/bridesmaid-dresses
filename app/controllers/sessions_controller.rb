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
        if params[:code].present?
          @bride= Bride.find_or_create_by(uid: auth['uid']) do |b|
            b.name = auth['info']['name']
          end
          session[:bride_id] = @bride.id
          redirect_to bride_path(@bride)
        else
          @bride = Bride.find_by(name: params[:bride][:name])
            if @bride && @bride.authenticate(params[:bride][:password])
              session[:bride_id] = @bride.id
              redirect_to bride_path(@bride)
            else
              redirect_to signin_path
            end
          end
      end
     
      private
     
      def auth
        request.env['omniauth.auth']
      end
    
    end