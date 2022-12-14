import 'package:flutter/material.dart';
import 'package:tuto_1/landing.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final formGlobalKey = GlobalKey<FormState>();

  isPasswordValid(password) {
    if (password == null || password.isEmpty) {
      return "Password should not be empty";
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
          title: const Text('Login'),
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
                    child: const Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
