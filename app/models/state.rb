class State < ApplicationRecord
    has_many :arrests
    has_many :crimes, through: :arrests
end
