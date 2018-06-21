class BridesmaidsController < ApplicationController

    def new
        @bride = Bride.find(params[:bride_id])
        @bridesmaid = @bride.bridesmaids.build
        @dress = Dress.new
    end

    def create
        @bridesmaid = Bridesmaid.new(bridesmaid_params)
        @bridesmaid.dress = Dress.find(params[:dress][:id])
        @bride = Bride.find(params[:bride_id ])
        if @bridesmaid.save
            redirect_to bride_bridesmaids_path(@bride)
        else 
            render :new
        end
    end

    
    private
    
        def bridesmaid_params
          params.require(:bridesmaid).permit(:name, :bride_id, :dress_id)
        end

end
