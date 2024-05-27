import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeView extends StatelessWidget {
  const QrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qr code',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Center(
        child: QrImageView(
          
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          data: '1234567890',
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
