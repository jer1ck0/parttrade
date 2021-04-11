class AddOrderToFinance < ActiveRecord::Migration[5.0]
  def change
    add_reference :finances, :order, foreign_key: true
  end
end
