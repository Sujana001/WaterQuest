import 'package:flutter/material.dart';
import 'package:waterquest_mvp/quizzes.dart';

class MiniGame extends StatefulWidget {
  const MiniGame({super.key});

  @override
  State<MiniGame> createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  int score1 = 0;
  int treesPlanted = 0;
  final int maxTrees = 2;

  void plantTree() {
    setState(() {
      score1 += 10;
      treesPlanted += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Game'),
        backgroundColor: Color.fromARGB(255, 14, 223, 251),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(150),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/p5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('Points: $score1', style: TextStyle(fontSize: 22)),
              Text(
                'Trees Planted: $treesPlanted',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

              // Draggable Tree
              Draggable<String>(
                data: 'tree',
                feedback: Image.asset('images/p9.jpg', width: 60),
                childWhenDragging: Opacity(
                  opacity: 0.3,
                  child: Image.asset('images/p9.jpg', width: 60),
                ),
                child: Image.asset('images/p9.jpg', width: 60),
              ),

              Spacer(),

              // Drop Area
              DragTarget<String>(
                onAcceptWithDetails: (data) {
                  if (data == data && treesPlanted <= maxTrees) {
                    plantTree();
                  }
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.brown,
                    child: Center(
                      child: Text(
                        'Drop Here to Plant a Tree!',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              const Spacer(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const Quizzes()),
                          ),
                        );
                      },
                      title: "Next",
                    ),
                  ],
                ),
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
        height: 50,
        width: 3000,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
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
