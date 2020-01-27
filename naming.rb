

require_relative 'patient'


PATIENT_NAMES = %w[Paul Mary John Peter]
ILLNESSES = %w[flu broken\ bone cancer]

 def this(people)
  p people
end

people = 4

# This is defined in the main scope
patient = Patient.new("Michael", "flu")

@patients = []
PATIENT_NAMES.each do |name|
  # This is private
  # outside this block
  # these variables are undefined
  illness = ILLNESSES.sample
  # # This in defined inside the block
  # # Different scope
  patient = Patient.new(name, illness)
  @patients << patient
end


this

p patient

