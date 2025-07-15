import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_chat/screens/account/account_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String ID = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'UniChat',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccountScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: user?.photoURL == null
                    ? const Icon(Icons.person, color: Colors.black)
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.greenAccent,
                            width: 5,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            user!.photoURL!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome ${user?.displayName ?? user?.email ?? 'Guest'}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
