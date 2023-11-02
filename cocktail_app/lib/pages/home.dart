import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String drinkName;
  late String img;
  List ingredients = [];

  void fetchCocktail(BuildContext context) async {
    final response = await http.get(
      Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var i = 17; i < 32; i++) {
        if (data['drinks'][0][i] != null) {
          ingredients.add(data['drinks'][0][i]);
        }
      }
      setState(() {
        drinkName = data['drinks'][0]['strDrink'];
        img = data['drinks'][0]['strDrinkThumb'];
      });

      showDialog(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          title: Text(
            "Drink Generated!",
            textAlign: TextAlign.center,
          ),
          content: Text('🍸 $drinkName 🍸\nPress view to see ingredients',
              textAlign: TextAlign.center),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } else {
      throw Exception(
          'HTTP request failed with status: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    drinkName = '';
    img = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 149, 201, 243),
            Color.fromARGB(255, 12, 206, 99),
          ],
        ),
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
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 250,
                      maxWidth: 250,
                      minHeight: 250,
                      minWidth: 250,
                    ),
                    child: img.isNotEmpty
                        ? Image.network(
                            img,
                          )
                        : const Placeholder(
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
              Container(
                child: Text('$drinkName',
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                height: 250,
                width: 250,
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Container(
                    //   child: Column(children: [
                    //      Text()
                    //   ],),
                    // ),
                    ElevatedButton(
                      onPressed: () => {},
                      child: const Text('View'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  fetchCocktail(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 233, 222, 120),
                  elevation: 0.5,
                  minimumSize: const Size(150, 70),
                ),
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
