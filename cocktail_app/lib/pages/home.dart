import 'dart:convert';
import 'dart:developer';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

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
              Color.fromARGB(255, 149, 201, 243),
              Color.fromARGB(255, 12, 206, 99)
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
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      child: const Text('View'),
                    ),
                  ],
                ),
              ),
              // child: const Text(
              //     'Ingredients:\n- whistky\n- apple juice\n- fruit punch')),
              ElevatedButton(
                // Generate random cocktail
                onPressed: () async {
                  final response = await http.get(Uri.parse(
                      'www.thecocktaildb.com/api/json/v1/1/random.php'));

                  if (response.statusCode == 200) {
                    final data = jsonDecode(response.body);
                    log(data);
                  } else {
                    throw Exception('HTTP Failed');
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 233, 222, 120),
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
