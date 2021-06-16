import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tubes/model/Item.dart';

class MTTMPerkalianScreen extends StatefulWidget {
  final int A, B;
  final double width;

  MTTMPerkalianScreen({
    required this.A,
    required this.B,
    required this.width,
  });

  _MTTMPerkalianScreen createState() => _MTTMPerkalianScreen();
}

class _MTTMPerkalianScreen extends State<MTTMPerkalianScreen> {
  final controller1 = ScrollController();
  final controller2 = ScrollController();
  final controller3 = ScrollController();
  List<Item> tape1 = [];
  List<Item> tape2 = [];
  List<Item> tape3 = [];
  int activeIndex1 = 3;
  int activeIndex2 = 3;
  int activeIndex3 = 3;
  double padding = 16.0;
  int total = 0;
  bool done = false;
  int q = 0;
  String hasil = '';
  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {});

  @override
  void initState() {
    super.initState();
    int count =  this.widget.width ~/ 50.0;
    total = count;
    if(count % 2 == 0) {
      padding = (this.widget.width % 50.0) / 2.0 + 25.0;
      total--;
    } else {
      if(this.widget.width % 50.0 > 32.0) {
        padding = (this.widget.width % 50.0) / 2;
      } else {
        padding = (this.widget.width % 50.0) / 2.0 + 50.0;
        total-=2;
      }
    }

    for(int i = 0; i < (total - 2) / 2; i++) {
      tape1.add(
        Item('-1', false)
      );
      tape2.add(
        Item('-1', false)
      );
      tape3.add(
        Item('-1', false)
      );
      activeIndex1++;
      activeIndex2++;
    }

    tape1.add(
      Item('B', false)
    );
    tape1.add(
      Item('B', false)
    );
    tape1.add(
      Item('B', false)
    );

    tape2.add(
      Item('B', false)
    );
    tape2.add(
      Item('B', false)
    );
    tape2.add(
      Item('B', false)
    );

    tape3.add(
      Item('B', false)
    );
    tape3.add(
      Item('B', false)
    );
    tape3.add(
      Item('B', false)
    );
    
    if(this.widget.A < 0) {
      tape1.add(
        Item('Y', false)
      );
      tape2.add(
        Item('B', false)
      );
      tape3.add(
        Item('B', false)
      );
      int tempA = this.widget.A * -1;
      for(int i = 0; i < tempA; i++) {
        tape1.add(
          Item('0', false)
        );
        tape2.add(
          Item('B', false)
        );
        tape3.add(
          Item('B', false)
        );
      }
    } else if(this.widget.A > 0) {
      tape1.add(
        Item('X', false)
      );
      tape2.add(
        Item('B', false)
      );
      tape3.add(
        Item('B', false)
      );
      for(int i = 0; i < this.widget.A; i++) {
        tape1.add(
          Item('0', false)
        );
        tape2.add(
          Item('B', false)
        );
        tape3.add(
          Item('B', false)
        );
      }
    }

    tape1.add(
      Item('1', false)
    );
    tape2.add(
      Item('B', false)
    );
    tape3.add(
      Item('B', false)
    );
    
    if(this.widget.B < 0) {
      tape1.add(
        Item('Y', false)
      );
      tape2.add(
        Item('B', false)
      );
      tape3.add(
        Item('B', false)
      );
      int tempB = this.widget.B * -1;
      for(int i = 0; i < tempB; i++) {
        tape1.add(
          Item('0', false)
        );
        tape2.add(
          Item('B', false)
        );
        tape3.add(
          Item('B', false)
        );
      }
    } else if(this.widget.B > 0) {
      tape1.add(
        Item('X', false)
      );
      tape2.add(
        Item('B', false)
      );
      tape3.add(
        Item('B', false)
      );
      for(int i = 0; i < this.widget.B; i++) {
        tape1.add(
          Item('0', false)
        );
        tape2.add(
          Item('B', false)
        );
        tape3.add(
          Item('B', false)
        );
      }
    }

    tape1.add(
      Item('B', false)
    );
    tape1.add(
      Item('B', false)
    );
    tape1.add(
      Item('B', false)
    );

    tape2.add(
      Item('B', false)
    );
    tape2.add(
      Item('B', false)
    );
    tape2.add(
      Item('B', false)
    );

    tape3.add(
      Item('B', false)
    );
    tape3.add(
      Item('B', false)
    );
    tape3.add(
      Item('B', false)
    );

    for(int i = 0; i < (total - 2) / 2; i++) {
      tape1.add(
        Item('-1', false)
      );
      tape2.add(
        Item('-1', false)
      );
      tape3.add(
        Item('-1', false)
      );
    }
  }

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
            timer.cancel();
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Standard Turing Machine',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.widget.A.toString() + ' * ' + this.widget.B.toString()),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
              ),
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tape1.length,
                controller: controller1,
                itemBuilder: (context, index) {
                  if(tape1[index].getContent() == '-1') {
                    return Container(
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Text(
                          tape1[index].getContent(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: tape1[index].getIsCurrent() == true ? Colors.lightBlue : Colors.lightGreen,
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                    );
                  }
                }
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
              ),
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tape2.length,
                controller: controller2,
                itemBuilder: (context, index) {
                  if(tape2[index].getContent() == '-1') {
                    return Container(
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Text(
                          tape2[index].getContent(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: tape2[index].getIsCurrent() == true ? Colors.lightBlue : Colors.lightGreen,
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                    );
                  }
                }
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
              ),
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tape3.length,
                controller: controller3,
                itemBuilder: (context, index) {
                  if(tape3[index].getContent() == '-1') {
                    return Container(
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Text(
                          tape3[index].getContent(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: tape3[index].getIsCurrent() == true ? Colors.lightBlue : Colors.lightGreen,
                        border: Border.all(color: Colors.white, width: 0.5),
                      ),
                    );
                  }
                }
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tape1[activeIndex1].setIsCurrent(true);
                  tape2[activeIndex2].setIsCurrent(true);
                  tape3[activeIndex3].setIsCurrent(true);
                  jumpToItem1();
                  jumpToItem2();
                  jumpToItem3();
                  q = 0;               
                });
                runTM();
              },
              child: const Text('Proses'),
            ),
            Text('Hasil:'),
            Text(done ? hasil.toString() : ''),
          ],
        ),
      ),
    );
  }

  void jumpToItem1() {
    int l = activeIndex1 - total~/2.0;
    double value = 50.0 * l;
    controller1.animateTo(
      value,
      duration: Duration(
        milliseconds: 500
      ),
      curve: Curves.ease,
    );
  }

  void jumpToItem2() {
    int l = activeIndex2 - total~/2.0;
    double value = 50.0 * l;
    controller2.animateTo(
      value,
      duration: Duration(
        milliseconds: 500
      ),
      curve: Curves.ease,
    );
  }

  void jumpToItem3() {
    int l = activeIndex3 - total~/2.0;
    double value = 50.0 * l;
    controller3.animateTo(
      value,
      duration: Duration(
        milliseconds: 500
      ),
      curve: Curves.ease,
    );
  }

  void runTM() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(!done) {
          if(q == 0) {
            q0();
          } else if(q == 1) {
            q1();
          } else if(q == 2) {
            q2();
          } else if(q == 3) {
            q3();
          } else if(q == 4) {
            q4();
          } else if(q == 5) {
            q5();
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  void q0() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch(a + b + c) {
      case 'XBB': {
        state('BBX', 'RSS', 1);
        break;
      }
      case 'YBB': {
        state('BYY', 'RSS', 1);
        break;
      }
      case '1BB': {
        state('BBB', 'SSS', 5);
        break;
      }
    }
  }

  void q1() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch(a + b + c) {
      case '0BX': {
        state('B0X', 'RSS', 1);
        break;
      }
      case '0BY': {
        state('B0Y', 'RSS', 1);
        break;
      }
      case '1BX': {
        state('BBX', 'RSS', 2);
        break;
      }
      case '1BY': {
        state('BBY', 'RSS', 2);
        break;
      }
    }
  }

  void q2() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch(a + b + c) {
      case 'XBX': {
        state('BBX', 'RLR', 3);
        break;
      }
      case 'YBX': {
        state('BBY', 'RLR', 3);
        break;
      }
      case 'YBY': {
        state('BBX', 'RLR', 3);
        break;
      }
      case 'XBY': {
        state('BBY', 'RLR', 3);
        break;
      }
      case 'BBX': {
        state('BBB', 'SSS', 5);
        break;
      }
      case 'BBY': {
        state('BBB', 'SSS', 5);
        break;
      }
    }
  }

  void q3() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch(a + b + c) {
      case '00B': {
        if(tape3[activeIndex3 + 3].getContent() == '-1') {
          tape3[activeIndex3 + 3].setContent('B');
          tape3.add(
            Item('-1', false)
          );
        }
        state('000', 'SLR', 3);
        break;
      }
      case '0BB': {
        state('BBB', 'RRS', 4);
        break;
      }
      case 'B0B': {
        state('BBB', 'SSS', 5);
        break;
      }
    }
  }

  void q4() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    String c = tape3[activeIndex3].getContent();
    switch(a + b + c) {
      case '00B': {
        if(tape3[activeIndex3 + 3].getContent() == '-1') {
          tape3[activeIndex3 + 3].setContent('B');
          tape3.add(
            Item('-1', false)
          );
        }
        state('000', 'SRR', 4);
        break;
      }
      case '0BB': {
        state('BBB', 'RLS', 3);
        break;
      }
      case 'B0B': {
        state('BBB', 'SSS', 5);
        break;
      }
    }
  }

  void q5() {
    int xCount = tape3.where((item) => item.getContent() == 'X').toList().length;
    int yCount = tape3.where((item) => item.getContent() == 'Y').toList().length;
    int zeroCount = tape3.where((item) => item.getContent() == '0').toList().length;
    if(xCount == 1) {
      hasil = zeroCount.toString();
    } else if(yCount == 1) {
      hasil = (zeroCount * -1).toString();
    } else {
      hasil = '0';
    }
    q = -1;
    done = true;
  }

  void state(String content, String move, int destQ) {
    tape1[activeIndex1].setContent(content[0]);
    tape2[activeIndex2].setContent(content[1]);
    tape3[activeIndex3].setContent(content[2]);
    if(move[0] == 'R') {
      r1();
    } else if(move[0] == 'L') {
      l1();
    }
    if(move[1] == 'R') {
      r2();
    } else if(move[1] == 'L') {
      l2();
    }
    if(move[2] == 'R') {
      r3();
    } else if(move[2] == 'L') {
      l3();
    }
    q = destQ;
  }

  void r1() {
    tape1[activeIndex1].setIsCurrent(false);
    activeIndex1++;
    jumpToItem1();
    tape1[activeIndex1].setIsCurrent(true);
  }

  void l1() {
    tape1[activeIndex1].setIsCurrent(false);
    activeIndex1--;
    jumpToItem1();
    tape1[activeIndex1].setIsCurrent(true);
  }

  void r2() {
    tape2[activeIndex2].setIsCurrent(false);
    activeIndex2++;
    jumpToItem2();
    tape2[activeIndex2].setIsCurrent(true);
  }

  void l2() {
    tape2[activeIndex2].setIsCurrent(false);
    activeIndex2--;
    jumpToItem2();
    tape2[activeIndex2].setIsCurrent(true);
  }

  void r3() {
    tape3[activeIndex3].setIsCurrent(false);
    activeIndex3++;
    jumpToItem3();
    tape3[activeIndex3].setIsCurrent(true);
  }

  void l3() {
    tape3[activeIndex3].setIsCurrent(false);
    activeIndex3--;
    jumpToItem3();
    tape3[activeIndex3].setIsCurrent(true);
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    timer.cancel();
    super.dispose();
  }
}