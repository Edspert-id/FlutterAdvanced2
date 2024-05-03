import 'package:flutter/material.dart';

import '../widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('assets/images/login-image.png'),
                const SizedBox(height: 56),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                const Text(
                  'Selamat Datang di Aplikasi Widya Edu\n'
                  'Aplikasi Latihan dan Konsultasi Soal',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6A7483),
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                LoginButton(
                  loginButtonVariant: LoginButtonVariant.google,
                ),
                SizedBox(height: 12),
                LoginButton(
                  loginButtonVariant: LoginButtonVariant.apple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
