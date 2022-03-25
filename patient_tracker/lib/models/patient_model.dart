import 'package:flutter/material.dart';

import 'medication.dart';

class Patient {
  final String firstName;
  final String lastName;
  final int age;
  final int status;
  final String hcp;
  final String startDate;
  final String endDate;
  final String symptoms;
  final String notes;
  final List<Medication> medication;

  Patient({
   required this.firstName,
   required this.lastName,
   required this.age,
   required this.status,
   required this.hcp,
   required this.startDate,
   required this.endDate,
   required this.symptoms,
   required this.notes,
   required this.medication,
  });

  factory Patient.fromJson(Map<String,dynamic> json){
    print(json);

    return Patient(
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
        age: json["age"] as int,
        status: json["status"] as int,
        hcp: json["hcp"] as String,
        startDate: json["startDate"] as String,
        endDate: json["endDate"] as String,
        symptoms: json["symptoms"] as String,
        notes: json["notes"] as String,
        medication: json["medication"] as List<Medication>,
    );
  }
}