class BridesController < ApplicationController

  before_action :redirect_to_root, :unless => :bride_self?, :only => [:edit, :update]

  def show
    @bride = Bride.find(params[:id])
    @bridesmaids = @bride.bridesmaids
    #byebug
  end
  
  def index
    @brides = Bride.all
  end

  def new
    @bride = Bride.new
  end

  def create
    @bride = Bride.new(bride_params)
    if @bride.save 
      session[:bride_id] = @bride.id
      redirect_to bride_path(@bride)
    else
      render :new
    end
  end

  def edit
    #byebug
    @bride = Bride.find(params[:id])
  end

  def update
    @bride = Bride.find(params[:id])
    if @bride.update(bride_params)
      redirect_to bride_path(@bride)
    else
      render :edit
    end
    
  end

private

    def bride_params
      params.require(:bride).permit(:name, :password, :grooms_name)
    end  

    def bride_self?
      #byebug
      current_user.id == params[:id].to_i
    end

end
