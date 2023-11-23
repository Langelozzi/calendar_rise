import 'package:calendar_rise/interfaces/auth_service_interface.dart';
import 'package:calendar_rise/models/authorized_user.dart';
import 'package:calendar_rise/services/google_auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// This page will list the calendars and allow people to select the ones to be tracked
class _HomePageState extends State<HomePage> {
  _HomePageState();

  signOut() async {
    AuthService authService = GoogleAuthService();
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: signOut,
              icon: const Icon(Icons.person),
              label: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
