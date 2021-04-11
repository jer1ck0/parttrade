class CreateClients < ActiveRecord::Migration[5.0]
  
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :secondname
      t.bigint :phone
      t.string :email
      t.string :adress
      t.boolean :admin
      t.string :role
      t.text :comment

      t.timestamps
    end

    
    create_table :orders do |t|
      t.references :user
      t.integer :manager
      t.string :name
      t.string :email
      t.bigint :phone
      t.text :message
      t.string :status
      t.text :comment

      t.timestamps
    end

    create_table :goods do |t|
      t.string :partnumber
      t.string :price
      t.integer :cost
      t.integer :outercost
      t.date :expdate
      t.references :order
      t.timestamps
    end
  end
end
