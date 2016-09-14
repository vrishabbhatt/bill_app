class PreSignUpController < ApplicationController
	def index
	end

	def index_bill_save
		bill = Bill.new
		redirect_to root_path
	end
end
