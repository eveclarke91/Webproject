# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 # Create some users
    User.create(name:'Mary Popina', email:'mp@gmail.com', password: "secret", password_confirmation: "secret")
    User.create(name:'Harry Potter', email:'hp@hogwarts.com', password: "hogwarts", password_confirmation: "hogwarts")
    User.create(name:'Lucy Smith', email:'ls@gmail.com', password: "secret", password_confirmation: "secret")

   
    user = User.find(1)
    user.employees.create(name: "Wendy woo", address: "iceland", phone: "0871234555", rate_of_pay: "12.50")
	user.employees.create(name: "Mike Ross", address: "new york", phone: "0871234111", rate_of_pay: "12.50")
	user.employees.create(name: "Pete Peterson", address: "Provience", phone: "0862343434", rate_of_pay: "11.00")
	
   
    user = User.find(2)
   emp1 =  user.employees.create(name: "Ron Swanson", address: "pawnee", phone: "0833333335", rate_of_pay: "14.50")
	emp2 = user.employees.create(name: "Willow woo", address: "iceland", phone: "0871234599", rate_of_pay: "10.50")
	emp3 = user.employees.create(name: "Frank walker", address: "iceland", phone: "0871234345", rate_of_pay: "9.50")
	
	user = User.find(1)
	user.shifts.create(start_time: "12", finish_time: "6", total_hours: "5")
	user.shifts.create(start_time: "11", finish_time: "6", total_hours: "6")
	user.shifts.create(start_time: "12", finish_time: "9", total_hours: "10")
    
	user = User.find(2)
	s1 = user.shifts.create(start_time: "9", finish_time: "6", total_hours: "8")
	s2 = user.shifts.create(start_time: "10", finish_time: "6", total_hours: "7")
	s3 = user.shifts.create(start_time: "12", finish_time: "9", total_hours: "10")
	
	user = User.find(1)
    user.holidays.create(start_date: "2015-12-29", finish_date: "2015-12-30")
	user.holidays.create(start_date: "2015-12-18", finish_date: "2015-12-19")
	
	user = User,find(2)
	hol1 = user.holidays.create(start_date: "2015-12-13", finish_date: "2015-12-16")
	hol2 = user.holidays.create(start_date: "2015-12-13", finish_date: "2015-12-19")
	
	user = User.find(1)
	ros1 = user.rosters.create(begin_date:"2016-01-01")
	ros2 = user.rosters.create(begin_date:"2016-03-08")
	
	user = User.find(2)
	 user.rosters.create(begin_date:"2016-07-07")
	 user.rosters.create(begin_date:"2016-05-05")
	
	
	user.find(1).employees << hol1
    user.find(2).employees << hol2
	
	user.find(1).rosters << emp1 << s1 
	user.find(1).rosters << emp2 << s2 
	user.find(2).rosters << emp3 << s1
	user.find(3).rosters <<emp1 <<s2
	
	