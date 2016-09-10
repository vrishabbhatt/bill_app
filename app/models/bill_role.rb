class BillRole < ActiveRecord::Base
	belongs_to :user
	belongs_to :bill
	has_many :bill_actions
end
