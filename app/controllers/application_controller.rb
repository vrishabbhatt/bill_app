class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
	def create_new_user_without_password user_email
		user = User.new(email: user_email , registered: false)
		user.skip_password_validation = true
		user.save
		#create mailer to be sent
		puts "==========================="
		puts user.id
		user.id
	end
end
