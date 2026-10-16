enum Urgent {
  yes,
  no
}

class Patient {
  final String patientId;
  final String name;
  final int age;
  final Urgent urgent;

  Patient(this.patientId, this.name, this.age, {this.urgent = Urgent.no});
}

class Hospital {
  List<Patient> patients = [];

  Hospital(this.patients);

  List<Patient> getUrgentPatient() {
    List<Patient> result = [];
    for(Patient p in patients){
      if(p.urgent == Urgent.yes) {
        result.add(p);
      }
    }
    return result;
  }
  List<Patient> getUrgentPatientFrom60() {
    List<Patient> result = [];
    for (Patient p in patients) {
      if (p.urgent == Urgent.yes && p.age >= 60) {
        result.add(p);
      }
    }
    return result;
  }
}

void main() {
  Hospital hospital = Hospital([
    Patient("P001", "Dara", 70, urgent: Urgent.yes),
    Patient("P002", "Sophea", 8),
    Patient("P003", "Malis", 55, urgent: Urgent.yes),
    Patient("P004", "Rith", 65)
  ]);

  print("Urgent Patient: ");
  for(Patient p in hospital.getUrgentPatient()) {
    print(p.name);
  }

  print("Urgent Patient: ");
  for (Patient p in hospital.getUrgentPatientFrom60()) {
    print(p.name);
  }
}