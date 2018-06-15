class BridesmaidsController < ApplicationController

    def new
        #byebug
        bride = Bride.find(params[:bride_id])
        #2nd you build a new one
    
        @bridesmaid = bride.bridesmaids.build
        #byebug
      end

end
