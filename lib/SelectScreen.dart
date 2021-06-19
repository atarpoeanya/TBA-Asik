import 'package:flutter/material.dart';
import 'package:tubes/multiTapeTM/MTTMFaktorialScreen.dart';
import 'package:tubes/multiTapeTM/MTTMLogaritmaBinerScreen.dart';
import 'package:tubes/multiTapeTM/MTTMModuloScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPangkatScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPembagianScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPenguranganScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPenjumlahanScreen.dart';
import 'package:tubes/multiTapeTM/MTTMPerkalianScreen.dart';
import 'package:tubes/standardTM/STMFaktorialScreen.dart';
import 'package:tubes/standardTM/STMLogaritmaBinerScreen.dart';
import 'package:tubes/standardTM/STMModuloScreen.dart';
import 'package:tubes/standardTM/STMPangkatScreen.dart';
import 'package:tubes/standardTM/STMPembagianScreen.dart';
import 'package:tubes/standardTM/STMPenguranganScreen.dart';
import 'package:tubes/standardTM/STMPenjumlahanScreen.dart';
import 'package:tubes/standardTM/STMPerkalianScreen.dart';

class SelectScreen extends StatelessWidget {
  final int type, A, B;

  SelectScreen({
    required this.type,
    required this.A,
    required this.B,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    'Pilih turing machine yang akan digunakan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      if (type == 1) {
                        return STMPenjumlahanScreen(
                          A: A,
                          B: B,
                          width: MediaQuery.of(context).size.width,
                        );
                      } else if (type == 2) {
                        return STMPenguranganScreen(
                          A: A,
                          B: B,
                          width: MediaQuery.of(context).size.width,
                        );
                      } else if (type == 3) {
                        return STMPerkalianScreen(
                          A: A,
                          B: B,
                          width: MediaQuery.of(context).size.width,
                        );
                      } else if (type == 4) {
                        return STMPembagianScreen(
                          A: A,
                          B: B,
                          width: MediaQuery.of(context).size.width,
                        );
                      } else if (type == 5) {
                        return STMFaktorialScreen(
                          A: A,
                          width: MediaQuery.of(context).size.width,
                        );
                      } else if (type == 6) {
                        return STMModuloScreen(
                          A: A,
                          B: B,
                          width: MediaQuery.of(context).size.width,
                        );
                      } else if (type == 7) {
                        return STMPangkatScreen(
                          A: A,
                          B: B,
                          width: MediaQuery.of(context).size.width,
                        );
                      } else {
                        return STMLogaritmaBinerScreen(
                          A: A,
                          width: MediaQuery.of(context).size.width,
                        );
                      }
                    }));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              'STM',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Standard Turing Machine',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    width: 300.0,
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
                        builder: (context) {
                          if(type == 1) {
                            return MTTMPenjumlahanScreen(
                              A: A,
                              B: B,
                              width: MediaQuery.of(context).size.width,
                            );
                          } else if(type == 2) {
                            return MTTMPenguranganScreen(
                              A: A,
                              B: B,
                              width: MediaQuery.of(context).size.width,
                            );
                          } else if(type == 3) {
                            return MTTMPerkalianScreen(
                              A: A,
                              B: B,
                              width: MediaQuery.of(context).size.width,
                            );
                          } else if(type == 4) {
                            return MTTMPembagianScreen(
                              A: A,
                              B: B,
                              width: MediaQuery.of(context).size.width,
                            );
                          } else if(type == 5) {
                            return MTTMFaktorialScreen(
                              A: A,
                              width: MediaQuery.of(context).size.width,
                            );
                          } else if(type == 6) {
                            return MTTMModuloScreen(
                              A: A,
                              B: B,
                              width: MediaQuery.of(context).size.width,
                            );
                          } else if(type == 7) {
                            return MTTMPangkatScreen(
                              A: A,
                              B: B,
                              width: MediaQuery.of(context).size.width,
                            );
                          } else {
                            return MTTMLogaritmaBinerScreen(
                              A: A,
                              width: MediaQuery.of(context).size.width,
                            );
                          }
                        }
                      )
                    );
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              'MTTM',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Multi Tape Turing Machine',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    width: 300.0,
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
          ),
        ),
      )
    );
  }
}
