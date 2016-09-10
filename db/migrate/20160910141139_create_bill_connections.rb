class CreateBillConnections < ActiveRecord::Migration
  def change
    create_table :bill_connections do |t|

      t.timestamps null: false
    end
  end
end
