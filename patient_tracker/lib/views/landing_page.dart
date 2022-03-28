import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
                padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: (25),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
