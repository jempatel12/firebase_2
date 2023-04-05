import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../helper/helper_firebase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> signinformkey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupformkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: signUp,
                child: Text("Sign Up With Email And Password"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuthHelper.firebaseAuthHelper.signInWithGoogle();
                },
                child: Text("Sign In With Google"),
              ),
              ElevatedButton(
                onPressed: signIn,
                child: Text("Sign In With Email And Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Sign Up",
          textAlign: TextAlign.center,
        ),
        content: Form(
          key: signupformkey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: (val) {
                  return (val!.isEmpty) ? "Enter Email Address" : null;
                },
                onSaved: (val) {
                  email = val;
                },
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                controller: passwordController,
                validator: (val) {
                  return (val!.isEmpty) ? "Enter Password" : null;
                },
                onSaved: (val) {
                  password = val;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (signupformkey.currentState!.validate()) {
                    signupformkey.currentState!.save();

                    User? user = await FirebaseAuthHelper.firebaseAuthHelper
                        .signUp(email: email!, password: password!);

                    if (user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("You Are Signed Up"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      Navigator.of(context).pushReplacementNamed('/');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("You Are Not Signed Up"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  }
                },
                child: Text("Submit"),
              ),
              OutlinedButton(
                onPressed: () {
                  emailController.clear();
                  passwordController.clear();

                  setState(() {
                    email = null;
                    password = null;
                  });
                },
                child: Text("Cancel"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signIn() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Sign In",
          textAlign: TextAlign.center,
        ),
        content: Form(
          key: signinformkey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: (val) {
                  return (val!.isEmpty) ? "Enter Email Address" : null;
                },
                onSaved: (val) {
                  email = val;
                },
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                controller: passwordController,
                validator: (val) {
                  return (val!.isEmpty) ? "Enter Password" : null;
                },
                onSaved: (val) {
                  password = val;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (signinformkey.currentState!.validate()) {
                    signinformkey.currentState!.save();

                    User? user = await FirebaseAuthHelper.firebaseAuthHelper
                        .signInWithEmailAndPassword(
                        email: email!, password: password!);

                    if (user != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("You Are Signed In"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      Navigator.of(context).pushReplacementNamed('/');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("You Are Not Signed In"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  }
                },
                child: Text("Submit"),
              ),
              OutlinedButton(
                onPressed: () {
                  emailController.clear();
                  passwordController.clear();

                  setState(() {
                    email = null;
                    password = null;
                  });
                },
                child: Text("Cancel"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}