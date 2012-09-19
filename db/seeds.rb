# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#Create the default Source Types for summation rules
Source_type.all.each do |st| st.destroy end
Source_type.make("County", 0)
Source_type.make("Sum of State", 1)
Source_type.make("Sum of Nation", 2)
#Source type of 3 equals 2 bitwisely



