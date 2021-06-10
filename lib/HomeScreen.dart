import 'package:flutter/material.dart';
import 'package:tubes/InputScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Turing Machine',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pilih operasi yang akan dilakukan',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(
                          type: 1,
                        ),
                      )
                    );
                  },
                  child: const Text('Penjumlahan'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(
                          type: 2,
                        ),
                      )
                    );
                  },
                  child: const Text('Pengurangan'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(
                          type: 3,
                        ),
                      )
                    );
                  },
                  child: const Text('Perkalian'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(
                          type: 4,
                        ),
                      )
                    );
                  },
                  child: const Text('Pembagian'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(
                          type: 5,
                        ),
                      )
                    );
                  },
                  child: const Text('Faktorial'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(
                          type: 6,
                        ),
                      )
                    );
                  },
                  child: const Text('Modulo'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(
                          type: 7,
                        ),
                      )
                    );
                  },
                  child: const Text('Pangkat'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputScreen(
                          type: 8,
                        ),
                      )
                    );
                  },
                  child: const Text('Logaritma biner'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}