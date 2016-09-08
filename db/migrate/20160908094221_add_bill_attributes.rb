class AddBillAttributes < ActiveRecord::Migration
  def change
  	add_column :bills , :bill_name , :string , default: nil
  	add_column :bills , :bill_description , :text
  	add_column :bills , :total , :int , default: 0
  end
end
