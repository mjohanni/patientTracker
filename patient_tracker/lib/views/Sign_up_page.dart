import 'package:flutter/material.dart';
import 'package:patient_tracker/services/api_services.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  final String ip;
  final String port;
  SignUpPage({required this.ip, required this.port});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/4,
                child: Image.asset("assets/images/logo.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ListTile(
                  title: const Text("Please enter username"),
                  subtitle: TextFormField(
                    controller: _username,
                    decoration: const InputDecoration(hintText: ""),
                  ),
                ),
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
                      await Provider.of<ApiServices>(context, listen: false).postDoctor(
                          username: _username.text,
                          email: _email.text,
                          password: _password.text,
                          ip: widget.ip,
                          port: widget.port);
                      // if()
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    ip: widget.ip,
                                    port: widget.port,
                                    doctor: _username.text,
                                  )));
                    },
                    child: Text("Sign up"),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
