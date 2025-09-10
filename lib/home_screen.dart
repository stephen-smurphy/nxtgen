import 'package:flutter/material.dart';
import 'features/nfc/nfc_scanner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NextGen Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // QR Scan Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/qr');
              },
              child: const Text("Scan QR Code"),
            ),

            const SizedBox(height: 20),

            // NFC Scan Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // Navigate to the new NFC scanner screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NfcScanner()),
                );
              },
              child: const Text("Scan NFC Tag"),
            ),
          ],
        ),
      ),
    );
  }
}