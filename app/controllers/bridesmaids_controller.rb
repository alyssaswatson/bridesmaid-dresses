class BridesmaidsController < ApplicationController

    def new
        #byebug
        bride = Bride.find(params[:bride_id])
        # build a new one
    
        @bridesmaid = bride.bridesmaids.build
        #byebug
    end

    def create
        #bride = Bride.find(params[:bride_id])
        @bridesmaid = Bridesmaid.new(bridesmaid_params)
        @bridesmaid.bride_id = params[:bride_id]
        byebug
        if @bridesmaid.save
          byebug
          redirect_to bride_path(bride)
        else
          render :new
        end
      end

    
    private
    
        def bridesmaid_params
        #byebug

          params.require(:bridesmaid).permit(:name, :bride_id, :dress_id)
        end

end
