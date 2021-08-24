class AddEstimatedDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :estimated_date, :timestamp
  end
end
