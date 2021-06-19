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
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Pilih operasi yang akan dilakukan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputScreen(
                            type: 1,
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                            ),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9AB1D2),
                              offset: Offset(0, 8),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputScreen(
                            type: 2,
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                            ),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9AB1D2),
                              offset: Offset(0, 8),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputScreen(
                            type: 3,
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '*',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          top: 16.0,
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9AB1D2),
                              offset: Offset(0, 8),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputScreen(
                            type: 4,
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '/',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                            ),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9AB1D2),
                              offset: Offset(0, 8),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputScreen(
                            type: 5,
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                            ),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9AB1D2),
                              offset: Offset(0, 8),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputScreen(
                            type: 6,
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                            ),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9AB1D2),
                              offset: Offset(0, 8),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputScreen(
                            type: 7,
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '^',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          top: 16.0,
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9AB1D2),
                              offset: Offset(0, 8),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputScreen(
                            type: 8,
                          ),
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Log\u{2082}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9AB1D2),
                              offset: Offset(0, 8),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
