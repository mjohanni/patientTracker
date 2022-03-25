import 'package:flutter/material.dart';
import 'package:patient_tracker/services/validation.dart';

import 'login_page.dart';

class IpConfig extends StatefulWidget {
  const IpConfig({Key? key}) : super(key: key);

  @override
  _IpConfigState createState() => _IpConfigState();
}

class _IpConfigState extends State<IpConfig> {
  final TextEditingController _ipAddress = TextEditingController();
  final TextEditingController _port = TextEditingController();

  void setIpAddress(){
    _ipAddress.clear();
    _port.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome",
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
                  child: Text("Connect to a server"),
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
                        title: const Text("Please enter Host ip:"),
                        subtitle: TextFormField(
                          controller: _ipAddress,
                          decoration: const InputDecoration(hintText: "0.0.0.0"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: const Text("Please enter port number:"),
                        subtitle: TextFormField(
                          controller: _port,
                          decoration: const InputDecoration(hintText: "1000 - 9999"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if(!ipValid(_ipAddress.text) || !portValid(_port.text)){
                            final snackBar = SnackBar(
                              content: const Text("Invalid Ip Address/Port number... try a new one"),
                              action: SnackBarAction(label: "clear all",onPressed: (){
                                _ipAddress.clear();
                                _port.clear();
                              },),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage(
                                        ip: _ipAddress.text, port: _port.text)));
                          }
                        },
                        child: const Text("CONNECT"),
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
