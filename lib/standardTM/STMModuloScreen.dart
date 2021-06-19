import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tubes/model/Item.dart';

class STMModuloScreen extends StatefulWidget {
  final int A, B;
  final double width;

  STMModuloScreen({
    required this.A,
    required this.B,
    required this.width,
  });

  _STMModuloScreen createState() => _STMModuloScreen();
}

class _STMModuloScreen extends State<STMModuloScreen> {
  final controller = ScrollController();
  List<Item> tape = [];
  int activeIndex = 3;
  double padding = 16.0;
  int total = 0;
  bool done = false;
  int q = 0;
  String hasil = '0';
  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {});

  int defSpeed = 1000;
  int defSpeedJ = 500;

  int curSpeed = 0;
  int curSpeedJ = 0;

  int twoTimeSpeed = 500;
  int twoTime = 250;

  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    int count = this.widget.width ~/ 50.0;
    total = count;
    if (count % 2 == 0) {
      padding = (this.widget.width % 50.0) / 2.0 + 25.0;
      total--;
    } else {
      if (this.widget.width % 50.0 > 32.0) {
        padding = (this.widget.width % 50.0) / 2;
      } else {
        padding = (this.widget.width % 50.0) / 2.0 + 50.0;
        total -= 2;
      }
    }

    for (int i = 0; i < (total - 2) / 2; i++) {
      tape.add(Item('-1', false));
      activeIndex++;
    }

    tape.add(Item('B', false));
    tape.add(Item('B', false));
    tape.add(Item('B', false));

    if (this.widget.A < 0) {
      tape.add(Item('Y', false));
      int tempA = this.widget.A * -1;
      for (int i = 0; i < tempA; i++) {
        tape.add(Item('0', false));
      }
    } else if (this.widget.A > 0) {
      tape.add(Item('X', false));
      for (int i = 0; i < this.widget.A; i++) {
        tape.add(Item('0', false));
      }
    }

    tape.add(Item('1', false));

    if (this.widget.B < 0) {
      tape.add(Item('Y', false));
      int tempB = this.widget.B * -1;
      for (int i = 0; i < tempB; i++) {
        tape.add(Item('0', false));
      }
    } else if (this.widget.B > 0) {
      tape.add(Item('X', false));
      for (int i = 0; i < this.widget.B; i++) {
        tape.add(Item('0', false));
      }
    }

    tape.add(Item('B', false));
    tape.add(Item('B', false));
    tape.add(Item('B', false));

    for (int i = 0; i < (total - 2) / 2; i++) {
      tape.add(Item('-1', false));
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
            Text(
              this.widget.A.toString() + ' % ' + this.widget.B.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              height: 50.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tape.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    if (tape[index].getContent() == '-1') {
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
                          color: Color(0xFFF1F4FA),
                          border:
                              Border.all(color: Color(0xFFF1F4FA), width: 0.5),
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text(
                            tape[index].getContent(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: tape[index].getIsCurrent() == true
                              ? Colors.lightBlueAccent
                              : Colors.lightBlue[700],
                          border:
                              Border.all(color: Color(0xFFF1F4FA), width: 0.5),
                        ),
                      );
                    }
                  }),
            ),
            AnimatedCrossFade(
                firstChild: Visibility(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: BoxDecoration(),
                    child: FloatingActionButton(
                      onPressed: () {
                        _isVisible = false;
                        curSpeed = defSpeed;
                        curSpeedJ = defSpeedJ;
                        setState(() {
                          tape[activeIndex].setIsCurrent(true);
                          jumpToItem(curSpeedJ);
                          q = 0;
                        });
                        runTM(curSpeed);
                      },
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ),
                ),
                secondChild: Visibility(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            curSpeed = defSpeed;
                            curSpeedJ = defSpeedJ;
                            timer.cancel();
                          },
                          child: Icon(Icons.pause),
                        ),
                        TextButton(
                          onPressed: () {
                            curSpeed = defSpeed;
                            curSpeedJ = defSpeedJ;
                            timer.cancel();
                            runTM(curSpeed);
                          },
                          child: Icon(Icons.play_arrow),
                        ),
                        TextButton(
                          onPressed: () {
                            curSpeed = twoTimeSpeed;
                            curSpeedJ = twoTime;
                            timer.cancel();
                            runTM(curSpeed);
                          },
                          child: Icon(Icons.fast_forward),
                        ),
                      ],
                    ),
                  ),
                ),
                crossFadeState: _isVisible
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 500)),
            Text('Hasil:', style: TextStyle(fontSize: 30)),
            Text(done ? hasil.toString() : '',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void jumpToItem(int s) {
    int l = activeIndex - total ~/ 2.0;
    double value = 50.0 * l;
    controller.animateTo(
      value,
      duration: Duration(milliseconds: s),
      curve: Curves.ease,
    );
  }

  void runTM(int s) {
    timer = Timer.periodic(Duration(milliseconds: s), (timer) {
      debugPrint(q.toString());
      setState(() {
        if (!done) {
          if (q == 0) {
            q0();
          } else if (q == 1) {
            q1();
          } else if (q == 2) {
            q2();
          } else if (q == 3) {
            q3();
          } else if (q == 4) {
            q4();
          } else if (q == 5) {
            q5();
          } else if (q == 6) {
            q6();
          } else if (q == 7) {
            q7();
          } else if (q == 8) {
            q8();
          } else if (q == 9) {
            q9();
          } else if (q == 10) {
            q10();
          } else if (q == 11) {
            q11();
          } else if (q == 12) {
            q12();
          } else if (q == 13) {
            q13();
          } else if (q == 14) {
            q14();
          } else if (q == 15) {
            q15();
          } else if (q == 16) {
            q16();
          } else if (q == 17) {
            q17();
          } else if (q == 18) {
            q18();
          } else if (q == 19) {
            q19();
          } else if (q == 20) {
            q20();
          } else if (q == 21) {
            q21();
          } else if (q == 22) {
            q22();
          } else if (q == 23) {
            q23();
          } else if (q == 24) {
            q24();
          } else if (q == 25) {
            q25();
          } else if (q == 26) {
            q26();
          } else if (q == 27) {
            q27();
          } else if (q == 28) {
            q28();
          } else if (q == 29) {
            q29();
          } else if (q == 30) {
            q30();
          } else if (q == 31) {
            q31();
          } else if (q == 32) {
            q32();
          } else if (q == 33) {
            q33();
          } else if (q == 34) {
            q34();
          } else if (q == 35) {
            q35();
          } else if (q == 36) {
            q36();
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  void q0() {
    switch (tape[activeIndex].getContent()) {
      case 'X':
        {
          state('X', 'R', 1);
          break;
        }
      case '1':
        {
          state('B', 'R', 27);
          break;
        }
      case 'Y':
        {
          state('B', 'R', 26);
          break;
        }
    }
  }

  void q1() {
    switch (tape[activeIndex].getContent()) {
      case '0':
        {
          state('0', 'R', 1);
          break;
        }
      case '1':
        {
          state('1', 'R', 2);
          break;
        }
    }
  }

  void q2() {
    switch (tape[activeIndex].getContent()) {
      case 'X':
        {
          state('B', 'R', 4);
          break;
        }
      case 'Y':
        {
          state('B', 'L', 3);
          break;
        }
      case 'B':
        {
          state('B', 'L', 29);
          break;
        }
    }
  }

  void q3() {
    switch (tape[activeIndex].getContent()) {
      case '1':
        {
          state('B', 'L', 31);
          break;
        }
    }
  }

  void q4() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'R', 4);
          break;
        }
      case 'B':
        {
          state('B', 'L', 9);
          break;
        }
      case '0':
        {
          state('Z', 'L', 5);
          break;
        }
    }
  }

  void q5() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'L', 5);
          break;
        }
      case 'B':
        {
          state('B', 'L', 6);
          break;
        }
    }
  }

  void q6() {
    switch (tape[activeIndex].getContent()) {
      case '1':
        {
          state('1', 'L', 7);
          break;
        }
    }
  }

  void q7() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'L', 7);
          break;
        }
      case '0':
        {
          state('Z', 'R', 8);
          break;
        }
      case 'X':
        {
          state('X', 'R', 10);
          break;
        }
    }
  }

  void q8() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'R', 8);
          break;
        }
      case '1':
        {
          state('1', 'R', 9);
          break;
        }
    }
  }

  void q9() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('0', 'L', 9);
          break;
        }
      case 'B':
        {
          state('B', 'R', 4);
          break;
        }
    }
  }

  void q10() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'R', 10);
          break;
        }
      case '1':
        {
          state('1', 'R', 11);
          break;
        }
    }
  }

  void q11() {
    switch (tape[activeIndex].getContent()) {
      case 'B':
        {
          state('B', 'R', 12);
          break;
        }
    }
  }

  void q12() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'R', 12);
          break;
        }
      case 'B':
        {
          state('B', 'L', 13);
          break;
        }
      case '0':
        {
          state('0', 'L', 13);
          break;
        }
    }
  }

  void q13() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('0', 'L', 14);
          break;
        }
    }
  }

  void q14() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('0', 'L', 15);
          break;
        }
      case 'B':
        {
          state('B', 'L', 22);
          break;
        }
    }
  }

  void q15() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'L', 15);
          break;
        }
      case 'B':
        {
          state('B', 'L', 16);
          break;
        }
    }
  }

  void q16() {
    switch (tape[activeIndex].getContent()) {
      case '1':
        {
          state('1', 'L', 17);
          break;
        }
    }
  }

  void q17() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'L', 17);
          break;
        }
      case 'X':
        {
          state('X', 'R', 18);
          break;
        }
      case '0':
        {
          state('0', 'R', 18);
          break;
        }
    }
  }

  void q18() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('0', 'R', 19);
          break;
        }
    }
  }

  void q19() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'R', 19);
          break;
        }
      case '1':
        {
          state('1', 'R', 20);
          break;
        }
    }
  }

  void q20() {
    switch (tape[activeIndex].getContent()) {
      case 'B':
        {
          state('B', 'R', 21);
          break;
        }
    }
  }

  void q21() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('Z', 'R', 21);
          break;
        }
      case 'B':
        {
          state('B', 'L', 14);
          break;
        }
      case '0':
        {
          state('0', 'L', 14);
          break;
        }
    }
  }

  void q22() {
    switch (tape[activeIndex].getContent()) {
      case '1':
        {
          state('B', 'L', 23);
          break;
        }
    }
  }

  void q23() {
    switch (tape[activeIndex].getContent()) {
      case 'Z':
        {
          state('B', 'L', 23);
          break;
        }
      case '0':
        {
          state('0', 'R', 24);
          break;
        }
      case 'X':
        {
          state('B', 'R', 24);
          break;
        }
    }
  }

  void q24() {
    switch (tape[activeIndex].getContent()) {
      case 'B':
        {
          state('B', 'R', 24);
          break;
        }
      case '0':
        {
          state('B', 'R', 25);
          break;
        }
    }
  }

  void q25() {
    switch (tape[activeIndex].getContent()) {
      case '0':
        {
          state('B', 'R', 25);
          break;
        }
      case 'B':
        {
          state('B', 'R', 36);
          break;
        }
    }
  }

  void q26() {
    switch (tape[activeIndex].getContent()) {
      case '0':
        {
          state('B', 'R', 26);
          break;
        }
      case '1':
        {
          state('B', 'R', 27);
          break;
        }
    }
  }

  void q27() {
    switch (tape[activeIndex].getContent()) {
      case 'X':
        {
          tape[activeIndex + 3].setContent('B');
          tape.add(Item('-1', false));
          state('B', 'R', 28);
          break;
        }
      case 'Y':
        {
          tape[activeIndex + 3].setContent('B');
          tape.add(Item('-1', false));
          state('B', 'R', 28);
          break;
        }
      case 'B':
        {
          tape[activeIndex + 3].setContent('B');
          tape.add(Item('-1', false));
          state('B', 'R', 28);
          break;
        }
    }
  }

  void q28() {
    switch (tape[activeIndex].getContent()) {
      case '0':
        {
          state('B', 'R', 28);
          break;
        }
      case 'B':
        {
          tape[activeIndex + 3].setContent('B');
          tape.add(Item('-1', false));
          state('Y', 'R', 34);
          break;
        }
    }
  }

  void q29() {
    switch (tape[activeIndex].getContent()) {
      case '1':
        {
          state('B', 'L', 30);
          break;
        }
    }
  }

  void q30() {
    switch (tape[activeIndex].getContent()) {
      case '0':
        {
          state('B', 'L', 30);
          break;
        }
      case 'X':
        {
          state('Y', 'R', 34);
          break;
        }
    }
  }

  void q31() {
    switch (tape[activeIndex].getContent()) {
      case '0':
        {
          state('B', 'L', 31);
          break;
        }
      case 'X':
        {
          state('B', 'R', 32);
          break;
        }
    }
  }

  void q32() {
    switch (tape[activeIndex].getContent()) {
      case 'B':
        {
          state('B', 'R', 32);
          break;
        }
      case '0':
        {
          state('B', 'R', 33);
          break;
        }
    }
  }

  void q33() {
    switch (tape[activeIndex].getContent()) {
      case '0':
        {
          state('B', 'R', 33);
          break;
        }
      case 'B':
        {
          tape[activeIndex + 3].setContent('B');
          tape.add(Item('-1', false));
          state('Y', 'R', 34);
          break;
        }
    }
  }

  void q34() {
    switch (tape[activeIndex].getContent()) {
      case 'B':
        {
          tape[activeIndex + 3].setContent('B');
          tape.add(Item('-1', false));
          state('X', 'R', 35);
          break;
        }
    }
  }

  void q35() {
    switch (tape[activeIndex].getContent()) {
      case 'B':
        {
          state('B', 'R', 36);
          break;
        }
    }
  }

  void q36() {
    int xCount = tape.where((item) => item.getContent() == 'X').toList().length;
    int yCount = tape.where((item) => item.getContent() == 'Y').toList().length;
    int zeroCount =
        tape.where((item) => item.getContent() == '0').toList().length;
    if (xCount == 1 && yCount == 1) {
      hasil = 'Tidak dapat diselesaikan';
    } else if (xCount == 1) {
      hasil = zeroCount.toString();
    } else {
      hasil = '0';
    }
    q = -1;
    done = true;
  }

  void state(String content, String move, int destQ) {
    tape[activeIndex].setContent(content);
    if (move == 'R') {
      R();
    } else if (move == 'L') {
      L();
    }
    q = destQ;
  }

  void R() {
    tape[activeIndex].setIsCurrent(false);
    activeIndex++;
    jumpToItem(curSpeedJ);
    tape[activeIndex].setIsCurrent(true);
  }

  void L() {
    tape[activeIndex].setIsCurrent(false);
    activeIndex--;
    jumpToItem(curSpeedJ);
    tape[activeIndex].setIsCurrent(true);
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }
}
