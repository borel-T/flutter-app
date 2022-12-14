import 'package:flutter/material.dart';
import "./teamDetails.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Feed(), Feed(), Feed(), Feed(), Feed()],
    );
  }
}

// feed widget
class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.all(15),
      height: 250,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 236, 234),
          border: Border.all(
            color: Color.fromARGB(255, 148, 146, 143),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Container(
          child: Row(children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/190px-FC_Barcelona_%28crest%29.svg.png"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Barcelona"),
            ),
          ]),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Forcejeo_Real_Madrid_-_FC_Barcelona.jpg/230px-Forcejeo_Real_Madrid_-_FC_Barcelona.jpg",
            fit: BoxFit.cover,
            height: 120,
            width: double.infinity,
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: (() => {
                      setState(() {
                        liked = !liked;
                      })
                    }),
                icon: liked
                    ? Icon(
                        Icons.favorite,
                        color: Colors.grey,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Football team"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100),
              child: ElevatedButton(
                child: const Text('View more'),
                onPressed: () {
                  // Navigate to details.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeamDetails(
                              name: "Barcelona",
                              imageUrl:
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Forcejeo_Real_Madrid_-_FC_Barcelona.jpg/230px-Forcejeo_Real_Madrid_-_FC_Barcelona.jpg",
                              description:
                                  "This Team has won UEFA champions leauge for several times. The club has alos being a kitchen where most world class players have arosed. This is definitely one of the best and biggest clubs in the spain leauge",
                            )),
                  );
                },
              ),
            )
          ],
        )
      ]),
    );
  }
}
