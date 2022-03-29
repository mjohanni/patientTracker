import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:patient_tracker/models/patient_model.dart';

import '../models/doctor.dart';

class HttpServices{
  Future<List<Patient>> getPatients({required String ip, required String port, required String name}) async {
    Uri patientsUrl = Uri.parse("http://localhost:$port/patients/$name");
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

    Uri loginUrl = Uri.parse("http://192.168.3.28:$port/$email/$password");
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

  Future<void> createDoctor(
      {required String hcp,
        required String email,
        required String password,
        required String ip,
        required String port}) async {
    print(ip+port+hcp+email+password);
    Response res;
    Uri postDoc = Uri.parse("http://192.168.3.28:$port/server/signup");

    res = await post(postDoc,
        body:
        jsonEncode(<String, String>{
          'hcp': hcp,
          'email' : email,
          'password' : password,
        }));

    if(res.statusCode == 200 || res.statusCode == 201){
      print("doctor has been added");
      // return Quote.fromJson(jsonDecode(res.body));
    }else{
      print(res.statusCode);
      print(res.body);
      throw Exception('Failed to add user');
    }
  }
}