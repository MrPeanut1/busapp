import 'package:flutter/material.dart';
<<<<<<< Updated upstream

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
      ),
    ),
  );
}

import 'package:busapp/startup_screen.dart';
import 'package:busapp/splash_page.dart';
import 'package:busapp/Screens/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Login(); // Creates instance of auth service and accesses the user stream on it
  }
}


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Set your desired theme here
//       ),
//       home: AppNavigator(), // Use a navigator to manage the screens
//     );
//   }
// }

// class AppNavigator extends StatefulWidget {
//   @override
//   _AppNavigatorState createState() => _AppNavigatorState();
// }

// class _AppNavigatorState extends State<AppNavigator> {
//   bool _showSplash = true;

//   @override
//   void initState() {
//     super.initState();
//     // Simulate an asynchronous operation
//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         _showSplash = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_showSplash) {
//       return const StartupScreen(); // Show the startup screen initially
//     } else {
//       return const SplashPage(); // Transition to your splash screen
//       // You can add a timer or any other logic to transition to the LoginPage after the splash screen if needed.
//       // For example, you could use a Future.delayed to wait a few seconds before navigating to LoginPage.
//       // After that, you can navigate to LoginPage using Navigator.pushReplacement.
//     }
//   }
// }
>>>>>>> Stashed changes
