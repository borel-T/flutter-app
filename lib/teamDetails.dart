import 'package:flutter/material.dart';
import "./payment.dart";

class TeamDetails extends StatelessWidget {
  const TeamDetails(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.description});

  final String imageUrl;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.network(
                  imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SubscriptionCard(type: "Basic", price: 200),
              SubscriptionCard(type: "Standard", price: 400),
              SubscriptionCard(type: "Basic", price: 550),
            ],
          ),
        ));
  }
}

class SubscriptionCard extends StatelessWidget {
  final String type;
  final int price;
  const SubscriptionCard({super.key, required this.type, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 189, 177, 165),
          border: Border.all(
            color: Color.fromARGB(255, 148, 146, 143),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Text("Subscribe to Team life"),
        SizedBox(height: 10),
        Text(type, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        Text(price.toString() + " Ruble", style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        TextButton(
            onPressed: () => {
                  // Navigate to details.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Payment()),
                  )
                },
            child: Text("Buy"))
      ]),
    );
  }
}
