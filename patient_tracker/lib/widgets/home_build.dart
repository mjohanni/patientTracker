import 'package:flutter/material.dart';

class HomeBuild extends StatelessWidget {
  String hcp;
  String ip;
  String port;
  HomeBuild({required this.hcp, required this.ip, required this.port});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Welcome Dr. $hcp",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
            SafeArea(
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    primary: true,
                    padding: const EdgeInsets.all(40),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      Container(
                        color: Colors.red,
                        child: Center(
                            child: Text("Patients List"),
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        child: Center(
                          child: Text("Add Patients"),
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text("Patient departure"),
                        ),
                      ),
                      Container(
                        color: Colors.yellow,
                        child: Center(
                          child: Text("Patient Status"),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
      ],
    );
  }
}
