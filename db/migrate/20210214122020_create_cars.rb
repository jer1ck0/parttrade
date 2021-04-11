class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :vin
      t.string :vendor
      t.string :model
      t.integer :year
      t.integer :mileage
      t.references :user
      t.string :comment
      t.timestamps
    end
  end
end
