class Product < ApplicationRecord
    has_many :breads
    has_many :donuts
    has_many :trays
end
