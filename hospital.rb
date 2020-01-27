
require_relative 'patient'
require_relative 'room'

paul = Patient.new(name: "Paul", illness: "broken leg")

puts "#{paul.name}:   #{paul.cured?}"

# Creating an instance of Room
# so that we can interact with it
room = Room.new(number: "303", capacity: 2)

puts "Before adding a patient:"
p room

# Store the patient instance in the room
room.add_patient(paul)

puts "After adding a patient:"
p room

puts "Let's cure Paul!"
paul.cure!

p room

begin
  mary = Patient.new(name: "Mary", illness: "broken leg")
  room.add_patient(mary)

  john = Patient.new(name: "John", illness: "broken leg")
  room.add_patient(john)
# this runs if the code within the begin block
# raise/throw a Room::CapacityExceededError
rescue Room::CapacityExceededError
  puts "Cannot check in patient! The room is full."
end

p room








