class ArrestSerializer < ActiveModel::Serializer
  attributes :id, :total_arrests, :male_arrests, :female_arrests, :year
  has_one :crime
end
