import 'package:flutter/material.dart';
import 'package:patient_tracker/services/api_services.dart';
import 'package:patient_tracker/views/ip_config_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ApiServices(),
      child: const MyApp(),
    ),
  );
  // runApp
  // (MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuoteServer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IpConfig(),
    );
  }
}
