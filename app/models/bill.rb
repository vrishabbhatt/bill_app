class Bill < ActiveRecord::Base
	has_many :bill_connections
	has_many :users ,  through: :bill_connections
end
