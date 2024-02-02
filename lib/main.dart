import 'package:dnaabsensi/screens/absen/checkin.dart';
import 'package:dnaabsensi/services/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DNA Konsultan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.colorSatu),
        useMaterial3: true,
      ),
      home: const CheckInPage(),
    );
  }
}
