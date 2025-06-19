import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;

  const Score({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Final Score'),
        backgroundColor: const Color.fromARGB(255, 14, 223, 251),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(150),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/p8.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Congratulations!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text('Your Total Points:', style: TextStyle(fontSize: 17)),
              SizedBox(height: 10),
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
