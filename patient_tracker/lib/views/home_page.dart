import 'package:flutter/material.dart';

import '../widgets/home_build.dart';

class HomePage extends StatelessWidget {
  final String ip;
  final String port;
  final String doctor;
  const HomePage({required this.ip, required this.port, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("_Home Screen_"),
      centerTitle: true,
      ),
      body: const HomeBuild(),
      floatingActionButton: FloatingActionButton (
        child: const Text("log out"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

