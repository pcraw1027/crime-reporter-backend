class Crime < ApplicationRecord
  has_many :arrests
  has_many :states, through: :arrests

  belongs_to :category
end
