import 'package:flutter/material.dart';
import 'package:tuto_1/landing.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final formGlobalKey = GlobalKey<FormState>();

  isNameValid(name) {
    if (name == null || name.isEmpty) {
      return "User name should not be empty";
    } else if (name.length < 3) {
      return "Password cannot be at less than 3";
    }
    return null;
  }

  isPasswordValid(password) {
    if (password == null || password.isEmpty) {
      return "Password should not be empty";
    } else if (password.length < 6) {
      return "Password should be at least 6";
    }
    return null;
  }

  isEmailValid(email) {
    if (email == null || email.isEmpty) {
      return "Email should not be empty";
    }
    if (!email.contains("@")) {
      ;
      return "Email should contain @";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextFormField(
                    decoration: const InputDecoration(labelText: "First name"),
                    validator: (value) {
                      return isNameValid(value);
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: const InputDecoration(labelText: "Last name"),
                    validator: (value) {
                      return isNameValid(value);
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) {
                      return isEmailValid(value);
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    maxLength: 6,
                    obscureText: true,
                    validator: (value) {
                      return isPasswordValid(value);
                    }),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (formGlobalKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        // go to landing page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Landing()),
                        );
                      }
                    },
                    child: const Text("Register")),
              ],
            ),
          ),
        ));
  }
}
