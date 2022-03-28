import 'package:flutter/material.dart';
import 'package:patient_tracker/services/http_services.dart';
import '../models/doctor.dart';
import '../models/patient_view_model.dart';

class ApiServices extends ChangeNotifier {
  late Doctor doctor;
  late List<PatientViewModel> patients = [];

  Future<void> fetchAllPatients(String ip, String port, String username)async {
    final patients = await HttpServices().getPatients(ip: ip, port: port, name: username);
    this.patients = patients.map((patient) => PatientViewModel(patient: patient)).toList();
    notifyListeners();
  }

  Future<void> getDoctor({required String email, required String password, required String ip, required String port}) async {
    doctor = (await HttpServices().getDoctor(email: email, password: password, port: port, ip: ip))!;
    notifyListeners();
  }
}