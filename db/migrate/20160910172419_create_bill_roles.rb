class CreateBillRoles < ActiveRecord::Migration
  def change
    create_table :bill_roles do |t|

      t.timestamps null: false
    end
  end
end
