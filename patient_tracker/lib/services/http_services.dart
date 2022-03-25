import 'dart:convert';

import 'package:http/http.dart';
import 'package:patient_tracker/models/patient_model.dart';

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
}