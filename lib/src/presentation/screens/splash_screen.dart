import 'package:edspert_advance_2/src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size size;

  @override
  void didChangeDependencies() {
    size = MediaQuery.sizeOf(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.edspertBlue,
      body: Center(
        child: Image.asset(
          'assets/images/edspert-logo.png',
          width: size.width * 0.5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
