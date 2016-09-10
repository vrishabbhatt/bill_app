class AddFieldsToBillActions < ActiveRecord::Migration
  def change
  	add_column :bill_actions , :bill_role_id , :int , default: nil
  	add_column :bill_actions , :amount_paying , :int , default: 0
  	add_column :bill_actions , :transacting_user_id , :int , default: nil
  	add_column :bill_actions , :is_verified , :boolean , default: false
  end
end
