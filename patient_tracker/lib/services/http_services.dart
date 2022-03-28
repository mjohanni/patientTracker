import 'dart:convert';

import 'package:http/http.dart';
import 'package:patient_tracker/models/patient_model.dart';

import '../models/doctor.dart';

class HttpServices{
  Future<List<Patient>> getPatients({required String ip, required String port, required String name}) async {
    Uri patientsUrl = Uri.parse("http://$ip:$port/patients/$name");
    Response res = await get(patientsUrl);

    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      List<Patient> patients = body.map((dynamic item) => Patient.fromJson(item)).toList();
      return patients;
    }
    else{
      throw "Can't get any patients";
    }
  }

  Future<Doctor?> getDoctor({required String email,required String password, required String port, required String ip}) async {

    Uri loginUrl = Uri.parse("http://$ip:$port/$email/$password");
    Response res = await get(loginUrl);

    if (res.statusCode == 200){
      Map<String,String> body = jsonDecode(res.body);
      print(body["hcp"]);
      print(body["email"]);
      print(body["password"]);

      Doctor doctor = Doctor.fromJson(body);
      if(doctor.hcp == "empty" && doctor.password == "empty" && doctor.email == "empty"){
        return null;
      }
      else{
        return doctor;
      }
    }
    return null;
  }
}