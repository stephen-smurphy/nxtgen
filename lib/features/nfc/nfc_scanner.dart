import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NfcScanner extends StatefulWidget {
  const NfcScanner({super.key});

  @override
  _NfcScannerState createState() => _NfcScannerState();
}

class _NfcScannerState extends State<NfcScanner> {
  String _nfcStatus = 'Checking NFC availability...';

  @override
  void initState() {
    super.initState();
    _checkNfcAvailability();
  }

  Future<void> _checkNfcAvailability() async {
    try {
      final availability = await FlutterNfcKit.nfcAvailability;
      if (availability == NFCAvailability.available) {
        setState(() {
          _nfcStatus = 'NFC is available. Ready to scan.';
        });
        // Proceed with NFC scanning logic
      } else {
        setState(() {
          _nfcStatus = 'NFC is not available on this device.';
        });
      }
    } catch (e) {
      setState(() {
        _nfcStatus = 'Error checking NFC availability: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NFC Scanner')),
      body: Center(
        child: Text(_nfcStatus),
      ),
    );
  }
}