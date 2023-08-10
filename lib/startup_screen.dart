import 'package:flutter/material.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RotationTransition(
          turns: _animationController,
          child: Image.asset(
            'assets/images/logo.png', // Replace with your logo asset path
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
