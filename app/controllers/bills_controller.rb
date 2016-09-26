class BillsController < ApplicationController
	before_action :authenticate_user! , :except => [:show]
	
	def index
		@bills = Bill.created_by(current_user.id)
	end

	def new
		@bill = Bill.new
	end

	def create
		@bill = Bill.new(bill_params)
		@bill.primary_user_id = current_user.id
		@bill.generate_role_for_primary_user(current_user.id)
		# create_primary_bill_connection		
		if @bill.save
			unless params[:bill][:bill_roles_attributes].blank?
				user_email = Array.new
				params[:bill][:bill_roles_attributes].each do |k,v|
					puts v[:user_email].to_s
					user_email.push(v[:user_email].to_s)
				end
				find_or_create_user_for_bill_roles user_email
			end
			flash[:notice] = "you have created a new bill"
			redirect_to bills_path
		else
			render 'new'
		end
	end

	def show
		@bill = Bill.find(params[:id])
	end

	def edit
		@bill = Bill.find(params[:id])
		has_permission

	end

	def update
		@bill = Bill.find(params[:id])
		@bill.update(bill_edit_params)
		respond_to do |format|
			format.js{}
			format.html{}
		end

	end

	def destroy 
		@bill = Bill.find(params[:id])
	end

	private
		def bill_params
			params.require(:bill).permit(:bill_name , :bill_description , :total , :no_of_users , :default_individual_amount ,bill_roles_attributes: [:user_email,:amount_paid, :_destroy])
		end

		def bill_edit_params
			params.require(:bill).permit(:bill_name , :bill_description , :total , :no_of_users , :default_individual_amount)
		end

		def has_permission
			if current_user.id != @bill.primary_user_id
				render 'warnings/unathorised_warning'
			end
		end

		# def	create_primary_bill_connection
		# 	bill_connection = BillConnection.new(user_id: current_user.id , bill_id: @bill.id)
		# 	bill_connection.save
		# end

		def find_or_create_user_for_bill_roles user_array
			i = 0
			@bill.bill_roles.each do |bill_role|
				bill_role.user_id = User.find_by(email: user_array[i])||create_new_user_without_password(user_array[i])
				bill_role.save
			end
		end

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
