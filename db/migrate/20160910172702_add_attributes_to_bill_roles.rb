class AddAttributesToBillRoles < ActiveRecord::Migration
  def change
  	add_column :bill_roles , :user_id , :int , default: nil
  	add_column :bill_roles , :bill_id , :int , default: nil
  	add_column :bills , :default_individual_amount , :int , default: 0
   	add_column :bill_roles , :amount_paid , :int , default: 0
   	add_column :bill_roles , :remaining_amount , :int , default: 0
  	add_column :bill_roles , :to_pay , :boolean
  end
end
