# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'



User.destroy_all
Event.destroy_all
Attendance.destroy_all


	#  ----- Users -----
	@user = User.create(
		last_name: "Tester",
		first_name: "Testy",
		email: "testy@test.fr",
		description: "je suis la merde elle meme", 
		encrypted_password: "lachiasse"
		)
	puts "#{@user.first_name} ajouté"

	#  ----- Events -----
	@event = Event.create(
		title: "titre",
		start_date: Faker::Time.forward(days: 23, period: :morning),
		duration: rand(1..40)*5,
		description: "liloulol",
		price: rand(1..100),
		location: Faker::Address.city,
		organizer: @user
    )
    
    #  ----- Attendances -----
	@attendance = Attendance.create(
		stripe_customer_id: Faker::Lorem.sentence(1),
		user: @user,
		event: @event
		)
	puts "Attendance added!"
