class BridesController < ApplicationController
  def index
    @brides = Bride.all
  end

  def new
    @bride = Bride.new
  end

  def create
    byebug

  end

end
