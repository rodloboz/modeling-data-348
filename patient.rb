# Object models a Patient with name, illness, cured
#
# Patient is instanciated with a hash of attributes
# Patient.new(illness: "Flu", name: "Mary")
class Patient
  # Shortcut to define Public interfaces
  # for these instance variables
  attr_reader :name, :illness

  # allows writing and reading of :id and :room
  attr_accessor :id, :room

  # CLASS METHOD to user in the PatientRepository
  # to write the csv headers
  #
  # Patient.csv_headers => [:id, :name, :cured]
  def self.csv_headers
    %i[id name illness cured]
  end

  # Is called on Patient.new
  def initialize(attributes = {})
    # Define initial state in instance variables
    @id = attributes[:id]
    @name = attributes[:name]
    @illness = attributes[:illness]
    @cured = attributes[:cured] || false # boolean
  end

  # Public interface:
  # Implements behaviour

  # INSTANCE METHOD to convert the patient instance
  # into an array which can be used in the PatientRepository
  # to write the patient data in the csv
  #
  # patient = Patient.new("Mary", "Flu")
  # patient.to_array => [3, "Mary", "Flu", false]
  def to_array
    [id, name, illness, cured]
  end

  # patient = Patient.new("Mary", "Flu")
  # patient.cured? => false
  def cured?
    @cured
  end

  def cure!
    @cured = true
  end

  # The getters can be replace with attr_reader
  # def name
  #   @name
  # end

  # def illness
  #   @illness
  # end

  # The room and room= can be replaced with
  # an attr_accessor

  # def room
  #  @room
  # end

  # def room=(room)
  #   @room = room
  # end
end
