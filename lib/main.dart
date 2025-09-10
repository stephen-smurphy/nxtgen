import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'features/qr/screens/qr_scanner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextGen Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/qr': (context) => const QrScannerScreen(),
        // No need for a dedicated NFC route yet, since we handle scanning directly on HomeScreen
      },
    );
  }
}