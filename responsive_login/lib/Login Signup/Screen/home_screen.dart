import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Login With Google/google_auth.dart';
import '../Widget/button.dart';
import 'login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // for google sign in user detail
            // User details in a Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // User's profile image
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(user?.photoURL ?? ''),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(width: 20), // Space between image and text
                // User details in a Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User's email
                    Text(
                      'Email: ${user?.email ?? 'No Email'}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // // User's display name
                    // Text(
                    //   'Name: ${user?.displayName ?? 'No Name'}',
                    //   style: const TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              "Congratulation\nYou have successfully Login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            MyButtons(
              onTap: () async {
                await FirebaseServices().googleSignOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              text: "Log Out"
            ),
          ],
        ),
      ),
    );
  }
}