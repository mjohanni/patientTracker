import 'package:flutter/material.dart';
import 'package:patient_tracker/services/api_services.dart';
import 'package:patient_tracker/views/Sign_up_page.dart';
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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Doctor? doctor;

  void clearFields(){
    _email.clear();
    _password.clear();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Doctor doctor;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image.asset("assets/images/logo.jpg"),
                    ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                        child: ListView(
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
                                  doctor = await Provider.of<ApiServices>(context,listen:false).doctor;
                                  print(doctor.hcp);
                                  if (doctor.hcp.isNotEmpty && doctor.password.isNotEmpty && doctor.email.isNotEmpty) {
                                    print("yes");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage(
                                                ip: widget.ip, port: widget.port, doctor: doctor.hcp,)));
                                  }
                                  else{
                                    print("no");
                                  }
                              },
                              child: Text("LOGIN"),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage(ip: widget.ip, port: widget.port)));
                              },
                              child: Text("SIGN UP"),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
