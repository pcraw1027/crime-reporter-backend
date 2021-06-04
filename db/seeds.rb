# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Arrest.destroy_all
Crime.destroy_all
State.destroy_all
Category.destroy_all

#State stats data from kff.org - state health facts
s1 = State.create(abbreviation: "OR", name: "Oregon", population: 4128900, female_population: 2097000, male_population: 2031900)
s2 = State.create(abbreviation: "AR", name: "Arkansas", population: 2922500, female_population: 1507400, male_population: 1415100)
s3 = State.create(abbreviation: "IA", name: "Iowa", population: 3060200, female_population: 1546700, male_population: 1513500)
s4 = State.create(abbreviation: "KS", name: "Kansas", population: 2811200, female_population: 1432600, male_population: 1378600)
s5 = State.create(abbreviation: "CO", name: "Colorado", population: 5611800, female_population: 2802100, male_population: 2809700)

#Categories data setup
c1 = Category.create(name: "Possession") 
c2 = Category.create(name: "Sales")

#Crime data setup
o1 = Crime.create(name: "drug-possession-marijuana", category: c1)
o2 = Crime.create(name: "drug-possession-opium", category: c1)
o3 = Crime.create(name: "drug-possession-synthetic", category: c1)
o4 = Crime.create(name: "drug-possession-other", category: c1)
o5 = Crime.create(name: "drug-sales-marijuana", category: c2)
o6 = Crime.create(name: "drug-sales-opium", category: c2)
o7 = Crime.create(name: "drug-sales-synthetic", category: c2)
o8 = Crime.create(name: "drug-sales-other", category: c2)

#Arrests data setup
states = ["OR","AR","IA","KS","CO"]
crimes = ["drug-possession-marijuana","drug-possession-opium","drug-possession-synthetic","drug-possession-other","drug-sales-marijuana","drug-sales-opium","drug-sales-synthetic","drug-sales-other"]

states.each.with_index do |state,si|
    crimes.each.with_index do |crime,ci| 
       
        arrests = JSON.parse(File.read("db/data_files/#{state}_#{crime}.json"))
        arrests["results"].each do |arrest_item|
            total= arrest_item["male_count"].to_i + arrest_item["female_count"].to_i
            Arrest.create(state_id: si + 1 , 
                            crime_id: ci + 1, 
                            total_arrests: total.to_i, 
                            male_arrests: arrest_item["male_count"].to_i, 
                            female_arrests: arrest_item["female_count"].to_i, 
                            year: arrest_item["data_year"].to_i)
             
        end
    end
end

# # Oregon
# arrests = JSON.parse(File.read('db/data_files/OR_dpm.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s1, 
#                     crime: o1, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/OR_dpo.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s1, 
#                     crime: o2, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/OR_dps.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s1, 
#                     crime: o3, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/OR_dpot.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s1, 
#                     crime: o4, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/OR_dsm.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s1, 
#                     crime: o5, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/OR_dso.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s1, 
#                     crime: o6, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/OR_dss.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s1, 
#                     crime: o7, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/OR_dsot.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s1, 
#                     crime: o8, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# # Arkansas - AR
# arrests = JSON.parse(File.read('db/data_files/AR_dpm.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s2, 
#                     crime: o1, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/AR_dpo.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s2, 
#                     crime: o2, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/AR_dps.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s2, 
#                     crime: o3, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/AR_dpot.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s2, 
#                     crime: o4, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/AR_dsm.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s2, 
#                     crime: o5, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/AR_dso.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s2, 
#                     crime: o6, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/AR_dss.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s2, 
#                     crime: o7, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/AR_dsot.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s2, 
#                     crime: o8, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# # Iowa - IA



# # Kansas - KS



# # Colorado - CO
# arrests = JSON.parse(File.read('db/data_files/CO_dpm.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s5, 
#                     crime: o1, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/CO_dpo.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s5, 
#                     crime: o2, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/CO_dps.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s5, 
#                     crime: o3, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/CO_dpot.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s5, 
#                     crime: o4, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/CO_dsm.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s5, 
#                     crime: o5, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/CO_dso.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s5, 
#                     crime: o6, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/CO_dss.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s5, 
#                     crime: o7, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end

# arrests = JSON.parse(File.read('db/data_files/CO_dsot.json'))
# arrests.each do |arrest_item|
#     total_arr = arrest_item["male_count"] + arrest_item["female_count"]
#     Arrest.create(state: s5, 
#                     crime: o8, 
#                     total_arrests: total_arr, 
#                     male_arrests: arrest_item["male_count"], 
#                     female_arrests: arrest_item["female_count"], 
#                     year: arrest_item["data_year"])
# end