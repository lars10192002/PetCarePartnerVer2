# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



file = File.open("address_six_country.txt")
array = JSON.parse(file.read)
array.each do |address_six_country| 
    #sitter
    email = Faker::Internet.email
    name = Faker::Name.unique.name
    slogan = Faker::TvShows::GameOfThrones.quote

    price = Faker::Number.number(3)
    avatar = "https://api.adorable.io/avatars/285/#{Faker::Alphanumeric.alpha 5}@adorable.io.png"
    pic = "https://picsum.photos/300/300"
    number = rand(0..9)


    Sitter.create(avatar: avatar, name: name ,email: email, password: '123456', slogan:slogan, address:address_six_country, price:price, pet_limit: '3', pic: pic)
    User.create(avatar: avatar, name: name ,email: email, password: '123456', address:township_array[number])


    
    # Sitter.create(avatar: avatar, name: name ,email: email, password: '123456', slogan:slogan, address:'高雄市大寮區', price:price, pet_limit: '3', pic: pic)
    # User.create(name: name ,email: email, password: '123456')
    #User.create(name: "rich",email: "rich@123", password: '123456' )

    #Sitter.create(avatar: avatar, name: name ,email: email, password: '123456', slogan:slogan, address:'高雄市大寮區', price:price, pet_limit: '3', pic: pic)
    #Sitter.create(avatar: avatar, name: "rich1" ,email: "rich@123", password: '123456', slogan:slogan, address:'高雄市大寮區', price:price, pet_limit: '3', pic: pic)

    # User.create(name: name ,email: email, password: '123456')
    # Sitter.create(name: "rich1",email: "rich@123", password: '123456' )

    #Booking_date
    sitterid = Faker::Number.number(1)
    # BookingDate.create(sitter_id:sitterid, date: '24/11/2018', available: false)
}
