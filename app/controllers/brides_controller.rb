class BridesController < ApplicationController
  def show
    
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
      session[:bride_id] = @bride.id
      redirect_to bride_path(@bride)
    else
      render :new
    end
  end

  

end
