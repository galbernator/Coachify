# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_roles = ['Site Admin', 'Company Owner', 'Company Admin', 'Regional Manager', 'Account Executive', 'District Manager', 'Store Manager', 'Employee']
user_roles.each do |role|
  Role.create(position: role)
end
