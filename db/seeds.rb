puts "Planting seeds!"

20.times do
    Audition.create(
        actor: Faker::Name.name,
        location: Faker::Address.city,
        phone: Faker::PhoneNumber.phone_number,
        hired: Faker::Boolean.boolean,
        role_id: rand(0..10)
    )
end

10.times do
    Role.create(
        character_name: Faker::Games::StreetFighter.character
    )
end



puts "All seeds planted!"