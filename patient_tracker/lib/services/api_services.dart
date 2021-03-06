import 'package:flutter/material.dart';
import 'package:patient_tracker/services/http_services.dart';
import '../models/doctor.dart';
import '../models/patient_view_model.dart';

class ApiServices extends ChangeNotifier {
  late Doctor doctor = Doctor(email: "", password: "", hcp: "");
  late List<PatientViewModel> patients = [];

  Future<void> fetchAllPatients(String ip, String port, String username)async {
    final patients = await HttpServices().getPatients(ip: ip, port: port, name: username);
    this.patients = patients.map((patient) => PatientViewModel(patient: patient)).toList();
    notifyListeners();
  }

  Future<void> getDoctor({required String email, required String password, required String ip, required String port}) async {
    doctor = (await HttpServices().getDoctor(email: email, password: password, port: port, ip: ip))!;
    // print(doctor.hcp + doctor.email+ doctor.password);
    notifyListeners();
  }

  Future<void> postDoctor({required String username,required String email,required String password,required String ip,required String port}) async {
    await HttpServices().createDoctor(hcp: username, email: email, password: password, ip: ip, port: port);
    notifyListeners();
  }
}