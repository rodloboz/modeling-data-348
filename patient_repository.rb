require 'byebug'
require 'csv'

require_relative 'patient'

# This will store an array of patients
# also handles persistence
# PatientReposity.new("patients.csv")
class PatientRepository
  CSV_DEFAULT_OPTIONS = {
    headers: :first_row,
    header_converters: :symbol
  }

  def initialize(filepath)
    @patients = []
    @filepath = filepath
    @next_id = 1
    load_csv
  end

  def add_patient(patient)
    # patient has no id;
    patient.id = @next_id
    # assigns next id to patient
    @patients << patient
    # increment next id
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@filepath, CSV_DEFAULT_OPTIONS) do |row|
      # Create hash of attributes for Patient.new
      attributes = {
        name: row[:name],
        illness: row[:illness],
        cured: row[:cured] == "true" # converts it to a real boolean
      }

      # Alternativelly, because a row behaves like an hash
      # we can use the row  => This is called Duck Typing
      # (if it quacks like a duck, it must be a duck)

      # convert the row columns as needed
      row[:id] = row[:id].to_i # id must be an integer
      row[:cured] = row[:cured] == "true" # cured must be a real boolean

      # attributes = {
      #   name: row[:name],
      #   illness: row[:illness],
      #   cured: row[:cured] == "true" # converts it to a real boolean
      # }

      # create new patient instance with the data in row
      patient = Patient.new(row)
    end

    # If the CSV is empty (no patients), the @next_id should be 0
    # otherwise the @next_id should be the last patient :id plust 1
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def save_csv
    CSV.open(@csv_filepath, 'wb', CSV_DEFAULT_OPTIONS) do |csv|
      # The csv MUST HAVE headers:
      # We can do this by writing the headers ourselves:
      # csv << [:id, :name, :cured]

      # Or we can teach the class how to do this:
      csv << Patient.csv_headers # CLASS METHOD

      # Write every patient into the csv file
      @patients.each do |patient|
        # csv accepts Arrays
        # we teach the patient how to build itself
        # into an Array
        csv << patient.to_array # INSTANCE METHOD
      end
    end
  end
end

PatientRepository.new("patients.csv")
