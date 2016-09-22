class BillRolesController < ApplicationController
	def create
	end

	def update
		@bill_role = BillRole.find(params[:id])
		@bill_role.update(bill_role_params)
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
