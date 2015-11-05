class HomeController < ApplicationController
  def index
  	if session[:user_id]
  		redirect_to "/login_success"
  	end
  end
end
