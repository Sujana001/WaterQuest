import 'package:flutter/material.dart';
import 'package:waterquest_mvp/regions.dart';

class WorldMap extends StatefulWidget {
  const WorldMap({super.key});

  @override
  State<WorldMap> createState() => _WorldMapState();
}

class _WorldMapState extends State<WorldMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(150),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/p2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => const Regions())),
                  );
                },
                title: "Bangladesh",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key, required this.title, required this.press});
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 60,
        width: 1000,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40),
          color: Color.fromARGB(0, 0, 0, 0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
