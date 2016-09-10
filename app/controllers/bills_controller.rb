class BillsController < ApplicationController
	before_action :authenticate_user!
	
	def index
	end

	def new
		@bill = Bill.new
	end

	def create
		@bill = Bill.new(bill_params)
		@bill.primary_user_id = current_user.id
		create_primary_bill_connection
		if @bill.save?
			redirect_to bills_path
			flash[:notice] = "you have created a new bill"
		else
			render 'new'
		end
	end

	def show
		@bill = Bill.find(params[:id])
		has_permission
	end

	def edit
	end

	def update
	end

	def destroy 
	end

	private
		def bill_params
			params.require(:bill).permit(:bill_name , :bill_description , :total , :no_of_users)
		end

		def has_permission
			if current_user.id != @bill.primary_user_id
				render 'warnings/unathorised_warning'
			end
		end

		def	create_primary_bill_connection
			bill_connection = BillConnection.new(user_id: current_user.id , bill_id: @bill.id)
		end
end
