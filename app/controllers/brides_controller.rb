class BridesController < ApplicationController
  def index
    @brides = Bride.all
  end

end
