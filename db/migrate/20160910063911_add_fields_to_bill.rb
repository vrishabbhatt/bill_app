class AddFieldsToBill < ActiveRecord::Migration
  def change
  	add_column :bills , :primary_user_id , :int , default: nil
  	add_column :bills , :no_of_users , :int , default: 0
  end
end
