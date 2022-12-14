import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(children: [
        const Text(
          "Football Teams",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
            child: Container(
          child: FootballList(),
        )),
        const SizedBox(height: 30),
        const Text(
          "Hockey Teams",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
            child: Container(
          child: FootballList(),
        )),
      ]),
    );
  }
}

class FootballList extends StatelessWidget {
  const FootballList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: const [
        TeamCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/thumb/3/32/FC_Rubin_Kazan_logo.svg/140px-FC_Rubin_Kazan_logo.svg.png",
            description:
                "Legendary football club. They have won a lot of Cups and Championships. Association football, more commonly known as football or soccer,[a] is a team sport played between two teams of 11 players who primarily use their feet to propel the ball around a rectangular field called a pitch. The objective of the game is to score more goals than the opposition by moving the ball beyond the goal line into a rectangular framed goal defended by the opposing side. Traditionally, the game has been played over two 45 minute halves, for a total match time of 90 minutes. With an estimated 250 million players active in over 200 countries and territories, it is considered the world's most popular sport.",
            name: "Kazan FC"),
        TeamCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/190px-FC_Barcelona_%28crest%29.svg.png",
            description:
                "Legendary football club. They have won a lot of Cups and Championships. Association football, more commonly known as football or soccer,[a] is a team sport played between two teams of 11 players who primarily use their feet to propel the ball around a rectangular field called a pitch. The objective of the game is to score more goals than the opposition by moving the ball beyond the goal line into a rectangular framed goal defended by the opposing side. Traditionally, the game has been played over two 45 minute halves, for a total match time of 90 minutes. With an estimated 250 million players active in over 200 countries and territories, it is considered the world's most popular sport.",
            name: "Barcelona"),
        TeamCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/150px-Real_Madrid_CF.svg.png",
            description:
                "Legendary football club. They have won a lot of Cups and Championships. Association football, more commonly known as football or soccer,[a] is a team sport played between two teams of 11 players who primarily use their feet to propel the ball around a rectangular field called a pitch. The objective of the game is to score more goals than the opposition by moving the ball beyond the goal line into a rectangular framed goal defended by the opposing side. Traditionally, the game has been played over two 45 minute halves, for a total match time of 90 minutes. With an estimated 250 million players active in over 200 countries and territories, it is considered the world's most popular sport.",
            name: "Reacl Madrid"),
        TeamCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/thumb/f/fa/CSKA_Moscow_logo.png/150px-CSKA_Moscow_logo.png",
            description:
                "Legendary football club. They have won a lot of Cups and Championships. Association football, more commonly known as football or soccer,[a] is a team sport played between two teams of 11 players who primarily use their feet to propel the ball around a rectangular field called a pitch. The objective of the game is to score more goals than the opposition by moving the ball beyond the goal line into a rectangular framed goal defended by the opposing side. Traditionally, the game has been played over two 45 minute halves, for a total match time of 90 minutes. With an estimated 250 million players active in over 200 countries and territories, it is considered the world's most popular sport.",
            name: "CSKA Moscow"),
        TeamCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/en/thumb/a/a7/Paris_Saint-Germain_F.C..svg/180px-Paris_Saint-Germain_F.C..svg.png",
            description:
                "Legendary football club. They have won a lot of Cups and Championships. Association football, more commonly known as football or soccer,[a] is a team sport played between two teams of 11 players who primarily use their feet to propel the ball around a rectangular field called a pitch. The objective of the game is to score more goals than the opposition by moving the ball beyond the goal line into a rectangular framed goal defended by the opposing side. Traditionally, the game has been played over two 45 minute halves, for a total match time of 90 minutes. With an estimated 250 million players active in over 200 countries and territories, it is considered the world's most popular sport.",
            name: "PARIS SG"),
      ],
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.description});
  final String imageUrl;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
          border: Border.all(
            color: Color.fromARGB(255, 148, 146, 143),
            width: 1,
          ),
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Image.network(
          imageUrl,
          width: 150,
          height: 100,
        ),
        const SizedBox(height: 10),
        Text(name),
        const SizedBox(height: 8),
        ElevatedButton(
          child: const Text('View more'),
          onPressed: () {
            // Navigate to details.
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TeamDetails(
                        name: name,
                        imageUrl: imageUrl,
                        description: description,
                      )),
            );
          },
        )
      ]),
    );
  }
}

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
        ),
        body: Column(
          children: [
            Center(
              child: Image.network(
                imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
