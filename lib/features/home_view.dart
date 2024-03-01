import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../core/routing/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed(Routes.loginView);
              },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(user?.displayName ?? ""),
      ),
    );
  }
}
