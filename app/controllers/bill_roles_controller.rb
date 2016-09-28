class BillRolesController < ApplicationController
	def create
	end

	def update
		@bill_role = BillRole.find(params[:id])
		@bill_role.update(bill_role_params)
		unless params[:bill_role][:user_email].blank?
			if User.find_by(email: params[:bill_role][:user_email]).blank?
				@bill_role.user_id = create_new_user_without_password params[:bill_role][:user_email]
				@bill_role.save
			else
				puts "++++++++++++++_+_________________++++++++++++++++++++++++++"
				@bill_role.user_id = User.find_by(email: params[:bill_role][:user_email] ).id
				@bill_role.save
			end
		end
		respond_to do |format|
			format.js{
				flash[:notice] = "Bill Updated"
			}
			format.html{}
		end
	end

	private

	def bill_role_params
		params.require(:bill_role).permit(:user_email,:amount_paid,:remaining_amount)
	end
end
