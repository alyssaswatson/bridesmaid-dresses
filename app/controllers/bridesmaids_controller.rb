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

    def index
        @bride = Bride.find(params[:bride_id])
        @bridesmaids = @bride.bridesmaids
        #byebug
    end

    def edit
        @bride = Bride.find(params[:bride_id])
        @bridesmaid = Bridesmaid.find(params[:id])
        @dress = Dress.find(@bridesmaid.dress_id)
    end   

    def update
        @bridesmaid = Bridesmaid.find(params[:id])
        @bridesmaid.name = bridesmaid_params[:name]
        @bridesmaid.dress = Dress.find(params[:dress][:id])
        @bride = Bride.find(params[:bride_id])
        if @bridesmaid.save
            redirect_to bride_bridesmaids_path(@bride)
        else 
            render :edit
        end
    end

    
    private
    
        def bridesmaid_params
          params.require(:bridesmaid).permit(:name, :bride_id, :id)
        end

end
