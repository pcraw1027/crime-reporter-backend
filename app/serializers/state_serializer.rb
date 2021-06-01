class StateSerializer < ActiveModel::Serializer
  attributes :id, :abbreviation, :name, :population, :female_population, :male_population
end
