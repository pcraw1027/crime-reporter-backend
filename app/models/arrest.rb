class Arrest < ApplicationRecord
  belongs_to :state
  belongs_to :crime

  
end
