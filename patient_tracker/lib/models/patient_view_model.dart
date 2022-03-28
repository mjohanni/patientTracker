import 'package:patient_tracker/models/patient_model.dart';

import 'medication.dart';

class PatientViewModel{
  late final Patient patient;

  PatientViewModel({required this.patient});


  String get patientFirstName{
    return patient.firstName;
  }

  String get patientLastName{
    return patient.lastName;
  }

  int get patientAge{
    return patient.age;
  }

  int get patientStatus{
    return patient.status;
  }

  String get patientHcp{
    return patient.hcp;
  }

  String get patientStartDate{
    return patient.startDate;
  }

  String get patientEndDate{
    return patient.endDate;
  }

  String get patientSymptoms{
    return patient.symptoms;
  }

  String get patientNotes{
    return patient.notes;
  }

  List<Medication> get patientMedication {
    return patient.medication;
  }
}