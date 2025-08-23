import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final MobileScannerController cameraController = MobileScannerController();
  bool _dialogShown = false; // prevent multiple dialogs firing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch),
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (capture) {
          if (_dialogShown) return; // prevent reopening dialog
          final barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final value = barcodes.first.rawValue ?? "No data";

            _dialogShown = true;
            cameraController.stop(); // pause scanning while dialog is open

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("QR Code Scanned"),
                  content: Text(value),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close dialog
                        Navigator.pop(context, value); // return to home
                      },
                      child: const Text("OK"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close dialog only
                        cameraController.start(); // resume scanning
                        _dialogShown = false;
                      },
                      child: const Text("Scan Again"),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}