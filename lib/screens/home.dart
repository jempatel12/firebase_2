import 'package:flutter/material.dart';

import '../helper/helper_firebase.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You are Logged In",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.amber),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tap on Icon to Log Out",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.amber),
                ),
                IconButton(
                  onPressed: () async {
                    await FirebaseAuthHelper.firebaseAuthHelper.signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('login_page', (route) => false);
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}