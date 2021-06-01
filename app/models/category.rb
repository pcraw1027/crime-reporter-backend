class Category < ApplicationRecord
    has_many :crimes
    has_many :arrests, through: :crimes 
end
