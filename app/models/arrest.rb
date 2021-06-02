class Arrest < ApplicationRecord
  belongs_to :state
  belongs_to :crime

def self.find_crimes (state_id, crime_id)
  

  
    self_oregon_crimes_arr = self.where("state_id = #{state_id} AND crime_id = #{crime_id}")
                            .pluck("year, total_arrests")
                           
                          stateName= self.find(":state_id").name
                          crimeName= self.crime.name 
                           self_oregon_crimes_arr << {"state": stateName,"crime": crimeName}
                           
                            self_oregon_crimes_arr.to_h.symbolize_keys
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
