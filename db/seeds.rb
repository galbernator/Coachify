# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_roles = ['Site Admin', 'Company Owner', 'Company Admin', 'Regional Manager', 'District Manager', 'Store Manager', 'Employee']
user_roles.each do |role|
  Role.create(position: role)
end

Company.create!(name: "Banana Inc", email: "me@mail.com")

User.create!(first_name: "Steve", last_name: "Galbraith", email: "me@mail.com", password: "abc123", company: 1, role_id: 1)
