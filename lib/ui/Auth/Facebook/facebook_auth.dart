import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginWithFacebook extends StatefulWidget {
  const LoginWithFacebook({super.key});
  static const String routeName = 'facebookAuh';
  @override
  State<LoginWithFacebook> createState() => _LoginWithFacebookState();
}

class _LoginWithFacebookState extends State<LoginWithFacebook> {
  String? userEmail;

  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(permissions:['email'],
        );
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      setState(() {
        userEmail = userCredential.user!.email;
      });
    } catch (e) {
      print('Error logging in with Facebook : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Facebook'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          userEmail != null
              ? Text('Logged in as : $userEmail')
              : const Text('Not logged in'),
          ElevatedButton(
              onPressed: () {
                signInWithFacebook();
              },
              child: const Text('Login with Facebook'))
        ],
      ),
    );
  }
}
