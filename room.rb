# Object models a Room with a number, capacity, and patients
#
# Room.new(number: "303L", capacity: 2)
class Room
  class CapacityExceededError < StandardError; end

  # attr_reader :number, :capacity

  def initialize(attributes = {})
    @number = attributes[:number]
    # if the attributes doesn't include the :capacity key
    #.                   nil          || 0
    @capacity = attributes[:capacity] || 0 # default value
    @patients = [] # default value
  end

  # Public interface:
  # Implements behaviour
  def full?
    @patients.length >= @capacity
  end

  # patient = Patient.new("Mary", "flu")
  # room = Room.new("303L", 2)
  # room.add_patient(patient) # Patient object/instance
  def add_patient(patient)
    # if the number of patients in the room
    # is equal or greater than the capacity
    # then reject the patient
    if full?
      raise CapacityExceededError, "Room is Full"
    else
      @patients << patient

      # The patient checked into a room:
      # reference room instantance (self) in patient
      patient.room = self
    end
  end
end
