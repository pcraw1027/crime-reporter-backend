class Arrest < ApplicationRecord
  belongs_to :state
  belongs_to :crime

def self.find_crimes (state_id, crime_id)
    self_oregon_crimes_arr = self.where("state_id = #{state_id} AND crime_id = #{crime_id}")
                            .pluck("year, total_arrests")
                           
                          crimeName=  Arrest.where("crime_id=#{crime_id}").first.crime.name
                          stateName=  Arrest.where("state_id=#{state_id}").first.state.name
                          # stateName=  Arrest.find(state_id = state_id && crime_id = crime_id).state.name
                          # crimeName=  Arrest.find(state_id = state_id && crime_id = crime_id).crime.name
                          # self_oregon_crimes_arr << {"state": stateName,"crime": crimeName}
                          labelHash = {"#{stateName}:"=> crimeName} 
                          
                          return ([self_oregon_crimes_arr.to_h.symbolize_keys,labelHash])
end 

#   dataArr = Arrest.all.where("state_id = '1'"  && "crime_id = '1'")
#    outputArr = dataArr.map do |dataPoint|
#      year = dataPoint.year
#      total = dataPoint.total_arrests
#      newArr = [year, total] 
#      newArr 
#    end
#    outputArr
# end
end
