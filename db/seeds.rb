# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# =============================================================================================================
# 1. CREATE DRINKS
# =============================================================================================================

puts "========================="
puts "1. Creating drinks"
puts "========================="

#Create drinks based on data from NHS https://www.nhs.uk/live-well/alcohol-support/calculating-alcohol-units/
Drink.create(name: "1/2 Pinte of regular beer", volume: 25, alcohol_rate: 4.5)
Drink.create(name: "Pinte of regular beer", volume: 56.8, alcohol_rate: 4.5)
Drink.create(name: "1/2 Pinte of strong beer", volume: 25, alcohol_rate: 6.5)
Drink.create(name: "Pinte of strong beer", volume: 56.8, alcohol_rate: 6.5)
Drink.create(name: "1/2 Pinte of very strong beer", volume: 25, alcohol_rate: 8.5)
Drink.create(name: "Pinte of very strong beer", volume: 56.8, alcohol_rate: 8.5)
Drink.create(name: "Regular glass of wine", volume: 17.5, alcohol_rate: 12.5)
Drink.create(name: "Large glass of wine", volume: 25.0, alcohol_rate: 12.5)
Drink.create(name: "Cocktail", volume: 25.0, alcohol_rate: 4)
Drink.create(name: "Strong Cocktail", volume: 25.0, alcohol_rate: 8)
Drink.create(name: "Very strong Cocktail", volume: 25.0, alcohol_rate: 12)
Drink.create(name: "Small shooter", volume: 2.5, alcohol_rate: 40)
Drink.create(name: "Regular shooter", volume: 3.4, alcohol_rate: 40)

puts "#{ Drink.count } drinks created"

# =============================================================================================================
# 2. CREATE USERS
# =============================================================================================================

puts "\n\r========================="
puts "2. Creating users"
puts "========================="


#create fake users
User.create(email: "charles@test.com", password: "123456")
User.create(email: "jb@test.com", password: "123456")
User.create(email: "jp@test.com", password: "123456")
User.create(email: "oliver@test.com", password: "123456")
User.create(email: "edouard@test.com", password: "123456")
User.create(email: "chach@test.com", password: "123456")
User.create(email: "alex@test.com", password: "123456")
User.create(email: "greg@test.com", password: "123456")

puts "#{ User.count } users created"


# =============================================================================================================
# 3. ASSIGN DRINKS TO USERS
# =============================================================================================================

puts "========================="
puts "3. Assigning users to drinks"
puts "========================="

users = User.all
users.each do |user|
  rand(20..50).times {
    rand_drink_id = rand(1..13)
    rand_date =  (0..365).to_a.sample.days.ago.to_date
    UserDrink.create(user_id: user.id, drink_id: rand_drink_id, created_at: rand_date)
  }
end

puts "#{ UserDrink.count } drinks assigned to users"


# =============================================================================================================
# 4. CREATE EVENTS
# =============================================================================================================

# puts "\n\r========================="
# puts "4. Creating events"
# puts "========================="



# #create fake events
# EVENTS_NAME = ["Birthday", "Stag", "Diner", "Lunch", "Networking", "Clubbing", "Family party", "Party", "Pub", "Face-to-face"]

# EVENTS_NAME.each do |event_name|
#   event = Event.new
#   event.name = event_name
#   event.date = (15..365).to_a.sample.days.after.to_date
#   event.save
# end

# puts "#{ Event.count } events created"
