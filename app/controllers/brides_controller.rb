class BridesController < ApplicationController
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
  end

end
