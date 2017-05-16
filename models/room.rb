class Room
  attr_reader :patients
  attr_accessor :id
  def initialize(attr={})
    @patients = []
    @capacity = attr[:capacity] || 2
  end

  def add(patient)
  fail Exception, "Room is full!" if full?
    # 1 Add patient inside @patients
    @patients << patient
    # 2 assign to the patient the room itself
    # WHY???? BECAUSE WE WANT TO KNOW FROM THE PATIENT WHICH ROOM IT BELONGS.
    # IT MEANS THAT NOW WE CAN KNOW THE FOLLOWING INFO:
    # 1 - THIS ROOM, WHICH PEOPLE ARE HOSTED HERE?
    # 2 - THIS SPECIFIC PATIENT, TO WHICH ROOM IT BELONGS?
    patient.where_are_you = self
  end
  def full?
    # CHECKING IF IT'S FULL OR NOT
    @patients.size == @capacity
  end
end
