class Usermailer < ApplicationMailer
	def welcome_mail user
		@user = user
		mail(to: @user.email, subject: 'Welcome fg8') 
	end

	def welcome_and_continue_mail user , bill_id
		@user = user
		@bill_id = bill_id
		mail(to: @user.email , subject: 'welcome and complete fg8')
	end
end
