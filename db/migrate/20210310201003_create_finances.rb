class CreateFinances < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.integer :value
      t.boolean :dc
      t.references :user
      t.string :target
      t.string :comment
      
      t.timestamps
    end
  end
end
