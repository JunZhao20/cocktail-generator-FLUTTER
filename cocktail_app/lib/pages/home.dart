import "package:flutter/material.dart";

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(11, 104, 82, 10),
              Color.fromARGB(204, 233, 151, 83)
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            '🍸 Gen A Drink 🍸',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(122, 178, 187, 166),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(12.0)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'images/cocktail.jpg',
                    )),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                height: 250,
                width: 250,
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        'Ingredients',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              // child: const Text(
              //     'Ingredients:\n- whistky\n- apple juice\n- fruit punch')),
              ElevatedButton(
                // Generate random cocktail
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 231, 226, 182),
                    elevation: 0.5,
                    minimumSize: const Size(150, 70)),
                child: const Text(
                  'Generate',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
