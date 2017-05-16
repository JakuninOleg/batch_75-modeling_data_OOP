# What IS OUR GOAL HERE?! WE WANT TO DO AN MVC PATTERN WITH DIFFERENT MODELS
# REALLY IMPORTANT: FROM NOW ALL THE OBJECTS WILL BE IDENTIFIED BY ID!!!!!
require_relative "controllers/controller"
require_relative "models/patient"
require_relative "models/room"
require_relative "repos/patientRepository"

# WE SPECIFY THE CSV FILE
file = "data/patients.csv"
# WE CREATE THE REPOSITORU
patients_repo = PatientRepository.new(file)

#WE WANT TO CHECK ALL THE PATIENTS THAT WE LOADED FROM THE REPO THAT IS STORING ON A CSV FIL
p patients_repo.patients
bob = Patient.new(name: "Bob")
boby = Patient.new(name: "Boby")
patients_repo.add(bob)
patients_repo.add(boby)

# IT'S IMPORTANT TO POINT THAT WE ARE ADDING PATIENTS BECAUSE WE WANT TO HAVE CONTROL
# ON THE ID!!!!!!!
p patients_repo.patients
# john = Patient.new(name: "John")

# boby = Patient.new(name: "Boby")
# roomba = Room.new

# roomba.add(john)
# roomba.add(bob)


# p roomba.full?
# roomba.add(bob)
# p roomba.full?

# p roomba.patients
# p john.room


