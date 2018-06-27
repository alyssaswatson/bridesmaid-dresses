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
    @bride = Bride.new(bride_params)
    if @bride.save
      #byebug
      redirect_to bride_path(@bride)
    else
      render :new
    end
  end

  def edit
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


end
