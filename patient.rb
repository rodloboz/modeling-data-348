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
