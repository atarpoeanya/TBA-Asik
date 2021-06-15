import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tubes/model/Item.dart';

class MTTMPenguranganScreen extends StatefulWidget {
  final int A, B;
  final double width;

  MTTMPenguranganScreen({
    required this.A,
    required this.B,
    required this.width,
  });

  _MTTMPenguranganScreen createState() => _MTTMPenguranganScreen();
}

class _MTTMPenguranganScreen extends State<MTTMPenguranganScreen> {
  final controller1 = ScrollController();
  final controller2 = ScrollController();
  List<Item> tape1 = [];
  List<Item> tape2 = [];
  bool xIsPlus = true;
  int activeIndex1 = 3;
  int activeIndex2 = 3;
  double padding = 16.0;
  int total = 0;
  bool done = false;
  int q = 0;
  int hasil = 0;
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
    
    if(this.widget.A < 0) {
      tape1.add(
        Item('X', false)
      );
      tape2.add(
        Item('B', false)
      );
      xIsPlus = false;
      int tempA = this.widget.A * -1;
      for(int i = 0; i < tempA; i++) {
        tape1.add(
          Item('0', false)
        );
        tape2.add(
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
      xIsPlus = true;
      for(int i = 0; i < this.widget.A; i++) {
        tape1.add(
          Item('0', false)
        );
        tape2.add(
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
    
    if(this.widget.A != 0) {
      if(this.widget.B < 0 && xIsPlus) {
        tape1.add(
          Item('Y', false)
        );
        tape2.add(
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
        }
      } else if(this.widget.B < 0 && !xIsPlus) {
        tape1.add(
          Item('X', false)
        );
        tape2.add(
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
        }
      } else if(this.widget.B > 0 && xIsPlus) {
        tape1.add(
          Item('X', false)
        );
        tape2.add(
          Item('B', false)
        );
        for(int i = 0; i < this.widget.B; i++) {
          tape1.add(
            Item('0', false)
          );
          tape2.add(
            Item('B', false)
          );
        }
      } else if(this.widget.B > 0 && !xIsPlus) {
        tape1.add(
          Item('Y', false)
        );
        tape2.add(
          Item('B', false)
        );
        for(int i = 0; i < this.widget.B; i++) {
          tape1.add(
            Item('0', false)
          );
          tape2.add(
            Item('B', false)
          );
        }
      }
    } else {
      if(this.widget.B < 0) {
        tape1.add(
          Item('X', false)
        );
        tape2.add(
          Item('B', false)
        );
        xIsPlus = false;
        int tempB = this.widget.B * -1;
        for(int i = 0; i < tempB; i++) {
          tape1.add(
            Item('0', false)
          );
          tape2.add(
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
        xIsPlus = true;
        for(int i = 0; i < this.widget.B; i++) {
          tape1.add(
            Item('0', false)
          );
          tape2.add(
            Item('B', false)
          );
        }
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

    for(int i = 0; i < (total - 2) / 2; i++) {
      tape1.add(
        Item('-1', false)
      );
      tape2.add(
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
            Text(this.widget.A.toString() + ' + ' + this.widget.B.toString()),
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
            TextButton(
              onPressed: () {
                setState(() {
                  tape1[activeIndex1].setIsCurrent(true);
                  tape2[activeIndex2].setIsCurrent(true);
                  jumpToItem1();
                  jumpToItem2();
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
          } else if(q == 6) {
            q6();
          } else if(q == 7) {
            q7();
          } else if(q == 8) {
            q8();
          } else if(q == 9) {
            q9();
          } else if(q == 10) {
            q10();
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
    if(a == '' && b == '') {
      tape1[activeIndex1].setContent('');
      tape2[activeIndex2].setContent('');
      1();
      2();
      q = ;
    }
  }

  void q1() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q2() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q3() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q4() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q5() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q6() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q7() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q8() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q9() {
    String a = tape1[activeIndex1].getContent();
    String b = tape2[activeIndex2].getContent();
    switch(a + b) {
      case '': {
        tape1[activeIndex1].setContent('');
        tape2[activeIndex2].setContent('');
        1();
        2();
        q = ;
        break;
      }
    }
  }

  void q10() {
    int xCount = tape2.where((item) => item.getContent() == 'X').toList().length;
    int yCount = tape2.where((item) => item.getContent() == 'Y').toList().length;
    hasil = tape2.where((item) => item.getContent() == '0').toList().length;
    if(hasil == 0) {
      hasil = 0;
    } else {
      if(xCount == 1) {
        if(!xIsPlus) {
          hasil *= -1;
        }
      } else if(yCount == 1) {
        if(xIsPlus) {
          hasil *= -1;
        }
      } else {
        hasil = 0;
      }
    }
    q = -1;
    done = true;
  }

  void R1() {
    tape1[activeIndex1].setIsCurrent(false);
    activeIndex1++;
    jumpToItem1();
    tape1[activeIndex1].setIsCurrent(true);
  }

  void L1() {
    tape1[activeIndex1].setIsCurrent(false);
    activeIndex1--;
    jumpToItem1();
    tape1[activeIndex1].setIsCurrent(true);
  }

  void R2() {
    tape1[activeIndex2].setIsCurrent(false);
    activeIndex2++;
    jumpToItem2();
    tape1[activeIndex2].setIsCurrent(true);
  }

  void L2() {
    tape1[activeIndex2].setIsCurrent(false);
    activeIndex2--;
    jumpToItem2();
    tape1[activeIndex2].setIsCurrent(true);
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    timer.cancel();
    super.dispose();
  }
}