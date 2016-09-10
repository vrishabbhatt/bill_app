class CreateBillActions < ActiveRecord::Migration
  def change
    create_table :bill_actions do |t|

      t.timestamps null: false
    end
  end
end
