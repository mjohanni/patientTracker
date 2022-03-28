import 'package:flutter/material.dart';
import 'package:patient_tracker/services/api_services.dart';
import 'package:provider/provider.dart';

import '../models/doctor.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final String ip;
  final String port;
  LoginPage({required this.ip, required this.port});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void clearFields(){
    _email.clear();
    _password.clear();
  }
  @override
  Widget build(BuildContext context) {
    Doctor doctor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
          children: [Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(50, 90, 50, 10),
                  child: Text("Login"),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("Please enter account email"),
                        subtitle: TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(hintText: ""),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: const Text("Please enter user password"),
                        subtitle: TextFormField(
                          controller: _password,
                          decoration: const InputDecoration(hintText: ""),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                            await Provider.of<ApiServices>(context, listen: false).getDoctor(email: _email.text, password: _password.text, ip: widget.ip, port: widget.port);
                            // if()
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                        ip: widget.ip, port: widget.port, doctor: _email.text,)));
                        },
                        child: Text("START"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ]),
    );
  }
}
