import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final String ip;
  final String port;
  LoginPage({required this.ip, required this.port});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  void clearFields(){
    _username.clear();
    _password.clear();
  }
  @override
  Widget build(BuildContext context) {
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
                        title: const Text("Please enter account username"),
                        subtitle: TextFormField(
                          controller: _username,
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
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                        ip: widget.ip, port: widget.port, doctor: _username.text,)));
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
