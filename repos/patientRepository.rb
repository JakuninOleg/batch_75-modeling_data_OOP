# GOAL: ID!  ID!  ID!  ID!  ID!  ID!  ID!  ID!  ID!  ID!
#  ID!  ID!  ID!  ID!  ID!  ID!  ID!  ID!  ID!  ID!  ID!
require_relative "repository"
require_relative "../models/patient"

class PatientRepository < Repository
  attr_reader :patients
 def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    load_csv
 end

 def add(patient)
  # add patient into array
  @patients << patient
  # i have to know, or to set the ID
  # THANKS TO THE MAGIC OF LOAD_CSV @NEXT_ID NOW WE CAN SET THE ID AUTOMATICALLY
  patient.id = @next_id
  # patient.room.id
  # SETTING THE ID FOR THE NEXT ELEMENT WHEN WILL BE ADDED
  @next_id += 1
  # method to  save to csv
 end
 private
  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
      CSV.foreach(@csv_file, csv_options) do |row|
        row[:id]    = row[:id].to_i          # Convert column to Fixnum
        row[:cured] = row[:cured] == "true"  # Convert column to boolean

        @patients << Patient.new({ name: row[:name], id: row[:id], cured: row[:cured]})
      end

    # HERE IT'S THE MAGIC!!! WE CHECK IF WE HAVE ELEMENTS WHEN WE LOAD THE CSV.
    # IN THE CASE THAT THERE'S EMPTY, IT WILL SET THE NEXT ID AS 1.
    # OTHERWISE, WE CHECK WICH IS THE LAST ID AND THEN SET IT AS @NEXT_ID
    if @patients.empty?
      @next_id = 1
    else
      @next_id = @patients.last.id + 1
    end
  end

  def save_csv
    CSV.open(@csv_file,"wb") do |csv|
      # do some stuff
    end
  end

end
