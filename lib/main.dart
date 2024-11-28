import 'package:flutter/material.dart';
import 'package:headphone_ui/details_page.dart';
import 'package:headphone_ui/homepage.dart';
// import 'package:headphone_ui/details_page.dart';
// import 'homepage.dart';
// import 'eq_setting.dart';

// void main() {
//   runApp(const FirstRoute());
// }

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
     
      initialRoute: '/',
      routes: {
       
        '/': (context) => HomePage(),
    
        '/second': (context) => SecondScreen(),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the FirstScreen widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
