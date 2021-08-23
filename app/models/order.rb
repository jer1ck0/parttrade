class Order < ApplicationRecord
  belongs_to :user
  has_many :goods
  has_many :finances
end
