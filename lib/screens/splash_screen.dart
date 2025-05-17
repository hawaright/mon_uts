import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.9,
      upperBound: 1.1,
    )..repeat(reverse: true);

    // Après l'animation du texte, on montre le bouton
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2E7D32), // Vert émeraude foncé
              Color(0xFF81C784), // Vert clair doux
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _rotationController,
              builder: (_, child) {
                return RotationTransition(
                  turns: _rotationController,
                  child: ScaleTransition(
                    scale: _scaleController,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      child: Image.asset(
                        'assets/images/logo_uts.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Bienvenue à l\'UTS',
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E20), // Vert profond pour le texte
                  ),
                  speed: Duration(milliseconds: 80),
                ),
              ],
              totalRepeatCount: 1,
              onFinished: () {
                // Optionnel, déjà géré par delayed
              },
            ),
            SizedBox(height: 30),
            if (_showButton)
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                icon: Icon(Icons.arrow_forward),
                label: Text("Accéder à l'application"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red[800],

                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
