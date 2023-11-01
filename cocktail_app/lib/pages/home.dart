import "package:flutter/material.dart";

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          '🍸 Gen A Drink 🍸',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
        // Generate random cocktail
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 231, 226, 182),
            elevation: 0.5),
        child: const Text('Generate'),
      )),
    );
  }
}
