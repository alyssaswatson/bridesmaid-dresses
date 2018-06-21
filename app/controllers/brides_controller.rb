class BridesController < ApplicationController
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
    @bride = Bride.new
    @bride.name = params[:bride][:name]
    @bride.password = params[:bride][:password]
    @bride.grooms_name = params[:bride][:grooms_name]
    if @bride.save
      #byebug
      current_user
      redirect_to bride_path(@bride)
    else
      render :new
    end
  end

  

end
