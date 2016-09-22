class Bill < ActiveRecord::Base
	has_many :bill_connections
	has_many :bill_roles
	accepts_nested_attributes_for :bill_roles  ,reject_if: :all_blank, allow_destroy: true
	has_many :users ,  through: :bill_connections

	scope :created_by, ->(id){where(primary_user_id: id)}


	def generate_role_for_primary_user(user_id)
		bill_role =	BillRole.find_by(bill_id: self.id , user_id: user_id) || BillRole.create(bill_id: self.id , user_id: user_id )
		bill_role
	end
end

