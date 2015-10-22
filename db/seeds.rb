# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
monroe = User.create(
	fname: "Marilyn",
	lname: "Monroe",
	email: "monroe@hotmail.com",
	password: "happybirthdaymrpresident"
)
manson = User.create(
	fname: "Marilyn",
	lname: "Manson",
	email: "manson@berkowitz.com",
	password: "sweetdreamsaremadeofthese"
)
escobar = User.create(
	fname: "Pablo", 
	lname: "Escobar", 
	email: "pablo.escobar@gmail.com", 
	password: "senator"
)
montana = User.create(
	fname: "Tony", 
	lname: "Montana", 
	email: "tm@tm.com", 
	password: "mylittlefriend"
)
joel = User.create(
    fname:"Billy", 
    lname: "Joel", 
    email:"pianoman@aol.com", 
    password:"wedidntstartthefire", 
    fact:"He's actually 84, and not the piano man."
)

Post.create(content: "Where to go from here?", user_id: manson.id)
Post.create(content: "Say hello", user_id: montana.id)
Post.create(content: "Tax evasion is cool", user_id: escobar.id)
Post.create(content: "Uh oh", user_id: montana.id)
Post.create(content: "It's better to be happy alone than unhappy with someone -- so far.", user_id: monroe.id)

stout = Drink.create(name: "Guinness Stout", abv: 4)
water =Drink.create(name: "Water", abv: 0)
icedtea = Drink.create(name: "Iced Tea", abv: 0)
spikedicedtea = Drink.create(name: "Spiked Iced Tea", abv: 10)
scotch = Drink.create(name: "Single Malt Scotch", abv: 40)
UserDrink.create(user_id: escobar.id, drink_id: scotch.id)
UserDrink.create(user_id: manson.id, drink_id: stout.id)