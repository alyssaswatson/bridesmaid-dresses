class BridesmaidsController < ApplicationController

    before_action :redirect_to_root, :unless => :bride_bridesmaid_self?, :except => [:index]

    def new
        @bride = Bride.find(params[:bride_id])
        @bridesmaid = @bride.bridesmaids.build
        @dresses = Dress.all
    end

    def create
        @bridesmaid = Bridesmaid.new(bridesmaid_params)
        @bridesmaid.dress = Dress.find(params[:bridesmaid][:dress_id])
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
        @dresses = Dress.all
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

    def show
        @bridesmaid = Bridesmaid.find(params[:id])
    end

    def destroy
        @bride = Bride.find(params[:bride_id])
        @bridesmaid = Bridesmaid.find(params[:id])
        @bridesmaid.destroy
        redirect_to bride_path(@bride)
    end

    
    private
    
        def bridesmaid_params
            params.require(:bridesmaid).permit(:name, :bride_id, :id)
        end

        def bride_bridesmaid_self?
            #byebug
            current_user.id == params[:bride_id].to_i
        end

end
