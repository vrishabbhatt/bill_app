class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		redirect_to bills_path
  	else
  		render 'pre_sign_up/index'
  end
end
