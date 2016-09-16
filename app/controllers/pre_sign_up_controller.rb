class PreSignUpController < ApplicationController
	def index
	end

	def index_bill_save
		bill = Bill.new
		bill.no_of_users = params[:users]
		bill.total = params[:total]
		bill.default_individual_amount = params[:default_individual_amount]
		bill.save

		unless params[:amount_1].nil?
			num = params[:users].to_s.to_i
			i = 1
			while i <= num
				amount = ("amount_#{i}").to_sym
				bill_role = BillRole.new
				bill_role.amount_paid = params[amount]
				bill_role.remaining_amount = bill.default_individual_amount - bill_role.amount_paid
				if bill_role.remaining_amount > 0 
					bill_role.to_pay = true
				else
					bill_role.to_pay = false
				end
				bill_role.bill_id = bill.id
				bill_role.save
				puts  "bill role#{i} might be saved"
				i = i + 1 
			end
		end
		redirect_to new_user_registration_path(bill_id: bill.id)
	end
end


