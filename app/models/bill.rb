class Bill < ActiveRecord::Base
	has_many :bill_connections
	has_many :users ,  through: :bill_connections
	has_many :bill_roles

	def generate_role_for_primary_user(user_id)
		bill_role =	BillRole.find_by(bill_id: self.id , user_id: user_id) || BillRole.create(bill_id: self.id , user_id: user_id )
		bill_role
	end
end

