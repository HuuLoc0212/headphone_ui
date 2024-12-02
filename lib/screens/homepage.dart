import 'package:flutter/material.dart';
import 'package:headphone_ui/widgets/device.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My headphones'),
        centerTitle: true,
        leading: const Icon(Icons.refresh),
        actions:  [
         Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              'assets/images/Logo.png',
              height: 24,
              fit: BoxFit.contain,
            ),
         ),
          SizedBox(width: 8),
          Icon(Icons.add),
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            DeviceWidget(),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}