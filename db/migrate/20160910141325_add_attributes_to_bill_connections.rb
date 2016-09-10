class AddAttributesToBillConnections < ActiveRecord::Migration
  def change
  	add_column :bill_connections , :user_id , :int , default: nil
  	add_column :bill_connections , :bill_id , :int , default: nil
  end
end
