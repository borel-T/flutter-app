import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Support"),
          backgroundColor: Colors.orange,
        ),
        body: Faq());
  }
}

class Faq extends StatelessWidget {
  bool messageSent = false;

  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text("What is Fan is Fun :", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(
            "It's a platform where fans engage with their Teams. ",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          Text("What sports you will find here :",
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(
            "Hockey, Football, Volley and Besketball",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          Text("Subscription packages :", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(
            "Basic: 200, Standard: 400, Premium: 500",
            style: TextStyle(fontSize: 16),
          ),
          const MyContactForm(),
        ],
      ),
    );
  }
}

class MyContactForm extends StatefulWidget {
  const MyContactForm({super.key});

  @override
  State<MyContactForm> createState() => _MyContactFormState();
}

class _MyContactFormState extends State<MyContactForm> {
  final formGlobalKey = GlobalKey<FormState>();

  bool messageSent = false;

  @override
  Widget build(BuildContext context) {
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

    if (messageSent) {
      return Column(
        children: [
          SizedBox(height: 80),
          Text(
            "Thank you for you message. The support will contact you as soon as possible.",
            style: TextStyle(color: Colors.orange),
          )
        ],
      );
    }
    return Form(
      key: formGlobalKey,
      child: Column(
        children: [
          const SizedBox(height: 80),
          TextFormField(
              decoration: const InputDecoration(labelText: "Email"),
              validator: (value) {
                return isEmailValid(value);
              }),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter your message"),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                if (formGlobalKey.currentState!.validate()) {
                  // Validate returns true if the form is valid, or false otherwise.
                  setState(() {
                    messageSent = !messageSent;
                  });
                }
              },
              child: const Text("SEND"))
        ],
      ),
    );
  }
}
