import 'package:flutter/material.dart';

class SimpleTitlePage extends StatelessWidget {
  const SimpleTitlePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50), // Khoảng cách từ trên xuống
          Text(
            "Simple Page Title",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Welcome to your page!",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SimpleTitlePage(),
  ));
}
