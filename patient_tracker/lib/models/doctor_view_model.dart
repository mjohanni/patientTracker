import 'package:patient_tracker/models/doctor.dart';

class DoctorViewModel{
  late final Doctor doctor;

  DoctorViewModel({required this.doctor});

  String get doctorName{
    return doctor.hcp;
  }

  String get doctorEmail{
    return doctor.email;
  }

  String get doctorPassword{
    return doctor.password;
  }
}