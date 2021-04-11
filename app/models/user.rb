class User < ApplicationRecord
    has_many :cars
    has_many :orders
    
    def name_with_initial 
        firstname + " " + secondname
    end
end
