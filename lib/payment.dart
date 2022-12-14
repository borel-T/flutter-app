import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment"),
          backgroundColor: Colors.orange,
        ),
        body: PayForm());
  }
}

class PayForm extends StatefulWidget {
  const PayForm({super.key});

  @override
  State<PayForm> createState() => _PayFormState();
}

class _PayFormState extends State<PayForm> {
  bool paymentDone = false;

  final formGlobalKey = GlobalKey<FormState>();

  isValid(numb) {
    if (numb == null || numb.isEmpty) {
      return "Please input card number";
    }
    if (numb) {
      return "Please input card number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (paymentDone == true) {
      return Center(
        child: Column(children: [
          SizedBox(height: 100),
          Text(
            "PAYMENT SUCCESFULL",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/done.png',
            height: 100,
            width: 100,
          )
        ]),
      );
    }
    return Padding(
      padding: EdgeInsets.all(15),
      child: Form(
        key: formGlobalKey,
        child: Column(
          children: [
            const SizedBox(height: 80),
            TextFormField(
                decoration: const InputDecoration(labelText: "Card number"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  return isValid(value);
                }),
            const SizedBox(height: 20),
            TextFormField(
                decoration: const InputDecoration(labelText: "Month/Year"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  return isValid(value);
                }),
            const SizedBox(height: 20),
            TextFormField(
                decoration: const InputDecoration(labelText: "CW CODE"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  return isValid(value);
                }),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  setState(() {
                    paymentDone = !paymentDone;
                  });
                },
                child: const Text("Pay"))
          ],
        ),
      ),
    );
  }
}
