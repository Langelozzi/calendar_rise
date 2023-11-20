import 'package:calendar_rise/interfaces/auth_service_interface.dart';
import 'package:calendar_rise/models/authorized_user.dart';
import 'package:calendar_rise/services/google_auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> setUser() async {
    AuthService authService = GoogleAuthService();
    AuthorizedUser user = await authService.signIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Google Calendar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Connect Google Calendar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: setUser,
              icon: const Icon(Icons.person),
              label: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
