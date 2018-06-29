class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :authentication_required, except: [:new, :create, :index, :show]
  helper_method :current_user, :logged_in?
  layout "application"
  #before_action :authentication_required, except: [:index, :create, :new]

  def authentication_required
    if !logged_in?
      redirect_to_root
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    #byebug
    @current_user ||= Bride.find(session[:bride_id]) if session[:bride_id]
  end

  private

  def redirect_to_root
    redirect_to root_path
  end

end
