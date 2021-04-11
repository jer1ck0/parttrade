class AddEstimatedDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :estimated_date, :datestamp
  end
end
