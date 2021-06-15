import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tubes/model/Item.dart';

class STMPenguranganScreen extends StatefulWidget {
  final int A, B;
  final double width;

  STMPenguranganScreen({
    required this.A,
    required this.B,
    required this.width,
  });

  _STMPenguranganScreen createState() => _STMPenguranganScreen();
}

class _STMPenguranganScreen extends State<STMPenguranganScreen> {
  final controller = ScrollController();
  List<Item> tape = [];
  bool xIsPlus = true;
  int activeIndex = 3;
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
      tape.add(
        Item('-1', false)
      );
      activeIndex++;
    }

    tape.add(
      Item('B', false)
    );
    tape.add(
      Item('B', false)
    );
    tape.add(
      Item('B', false)
    );
    
    if(this.widget.A < 0) {
      tape.add(
        Item('X', false)
      );
      xIsPlus = false;
      int tempA = this.widget.A * -1;
      for(int i = 0; i < tempA; i++) {
        tape.add(
          Item('0', false)
        );
      }
    } else if(this.widget.A > 0) {
      tape.add(
        Item('X', false)
      );
      xIsPlus = true;
      for(int i = 0; i < this.widget.A; i++) {
        tape.add(
          Item('0', false)
        );
      }
    }

    tape.add(
      Item('1', false)
    );
    
    if(this.widget.A != 0) {
      if(this.widget.B < 0 && xIsPlus) {
        tape.add(
          Item('Y', false)
        );
        int tempB = this.widget.B * -1;
        for(int i = 0; i < tempB; i++) {
          tape.add(
            Item('0', false)
          );
        }
      } else if(this.widget.B < 0 && !xIsPlus) {
        tape.add(
          Item('X', false)
        );
        int tempB = this.widget.B * -1;
        for(int i = 0; i < tempB; i++) {
          tape.add(
            Item('0', false)
          );
        }
      } else if(this.widget.B > 0 && xIsPlus) {
        tape.add(
          Item('X', false)
        );
        for(int i = 0; i < this.widget.B; i++) {
          tape.add(
            Item('0', false)
          );
        }
      } else if(this.widget.B > 0 && !xIsPlus) {
        tape.add(
          Item('Y', false)
        );
        for(int i = 0; i < this.widget.B; i++) {
          tape.add(
            Item('0', false)
          );
        }
      }
    } else {
      if(this.widget.B < 0) {
        tape.add(
          Item('X', false)
        );
        xIsPlus = false;
        int tempB = this.widget.B * -1;
        for(int i = 0; i < tempB; i++) {
          tape.add(
            Item('0', false)
          );
        }
      } else if(this.widget.B > 0) {
        tape.add(
          Item('X', false)
        );
        xIsPlus = true;
        for(int i = 0; i < this.widget.B; i++) {
          tape.add(
            Item('0', false)
          );
        }
      }
    }

    tape.add(
      Item('B', false)
    );
    tape.add(
      Item('B', false)
    );
    tape.add(
      Item('B', false)
    );

    for(int i = 0; i < (total - 2) / 2; i++) {
      tape.add(
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
            Text(this.widget.A.toString() + ' - ' + this.widget.B.toString()),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
              ),
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tape.length,
                controller: controller,
                itemBuilder: (context, index) {
                  if(tape[index].getContent() == '-1') {
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
                          tape[index].getContent(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: tape[index].getIsCurrent() == true ? Colors.lightBlue : Colors.lightGreen,
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
                  tape[activeIndex].setIsCurrent(true);
                  jumpToItem();
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

  void jumpToItem() {
    int l = activeIndex - total~/2.0;
    double value = 50.0 * l;
    controller.animateTo(
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
          } else if(q == 11) {
            q11();
          } else if(q == 12) {
            q12();
          } else if(q == 13) {
            q13();
          } else if(q == 14) {
            q14();
          } else if(q == 15) {
            q15();
          } else if(q == 16) {
            q16();
          } else if(q == 17) {
            q17();
          } else if(q == 18) {
            q18();
          } else if(q == 19) {
            q19();
          } else if(q == 20) {
            q20();
          } else if(q == 21) {
            q21();
          } else if(q == 22) {
            q22();
          } else if(q == 23) {
            q23();
          } else if(q == 24) {
            q24();
          } else if(q == 25) {
            q25();
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  void q0() {
    switch(tape[activeIndex].getContent()) {
      case 'X': {
        tape[activeIndex].setContent('X');
        R();
        q = 1;
        break;
      }
      case '1': {
        tape[activeIndex].setContent('B');
        R();
        q = 13;
        break;
      }
    }
  }

  void q1() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('B');
        R();
        q = 2;
        break;
      }
      case '1': {
        tape[activeIndex].setContent('B');
        L();
        q = 8;
        break;
      }
    }
  }

  void q2() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        R();
        q = 2;
        break;
      }
      case '1': {
        tape[activeIndex].setContent('1');
        R();
        q = 3;
        break;
      }
    }
  }

  void q3() {
    switch(tape[activeIndex].getContent()) {
      case 'X': {
        tape[activeIndex].setContent('X');
        R();
        q = 10;
        break;
      }
      case 'Y': {
        tape[activeIndex].setContent('Y');
        R();
        q = 4;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('B');
        L();
        q = 9;
        break;
      }
    }
  }

  void q4() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        R();
        q = 4;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('0');
        tape[activeIndex].setIsCurrent(false);
        tape[activeIndex + 3].setContent('B');
        tape.add(
          Item('-1', false)
        );
        activeIndex--;
        jumpToItem();
        tape[activeIndex].setIsCurrent(true);
        q = 5;
        break;
      }
    }
  }

  void q5() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        L();
        q = 5;
        break;
      }
      case 'Y': {
        tape[activeIndex].setContent('Y');
        L();
        q = 6;
        break;
      }
    }
  }

  void q6() {
    switch(tape[activeIndex].getContent()) {
      case '1': {
        tape[activeIndex].setContent('1');
        L();
        q = 7;
        break;
      }
    }
  }

  void q7() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        L();
        q = 7;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('B');
        R();
        q = 1;
        break;
      }
    }
  }

  void q8() {
    switch(tape[activeIndex].getContent()) {
      case 'B': {
        tape[activeIndex].setContent('B');
        L();
        q = 8;
        break;
      }
      case 'X': {
        tape[activeIndex].setContent('B');
        R();
        q = 14;
        break;
      }
    }
  }

  void q9() {
    switch(tape[activeIndex].getContent()) {
      case '1': {
        tape[activeIndex].setContent('B');
        L();
        q = 15;
        break;
      }
    }
  }

  void q10() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        R();
        q = 10;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('B');
        L();
        q = 11;
        break;
      }
    }
  }

  void q11() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('B');
        L();
        q = 12;
        break;
      }
      case 'X': {
        tape[activeIndex].setContent('X');
        L();
        q = 17;
        break;
      }
    }
  }

  void q12() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        L();
        q = 12;
        break;
      }
      case 'X': {
        tape[activeIndex].setContent('X');
        L();
        q = 6;
        break;
      }
    }
  }

  void q13() {
    switch(tape[activeIndex].getContent()) {
      case 'X': {
        tape[activeIndex].setContent('Y');
        R();
        q = 24;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('B');
        R();
        q = 25;
        break;
      }
    }
  }

  void q14() {
    switch(tape[activeIndex].getContent()) {
      case 'B': {
        tape[activeIndex].setContent('B');
        R();
        q = 14;
        break;
      }
      case 'X': {
        tape[activeIndex].setContent('Y');
        R();
        q = 23;
        break;
      }
      case 'Y': {
        tape[activeIndex].setContent('X');
        R();
        q = 23;
        break;
      }
    }
  }

  void q15() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        L();
        q = 15;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('0');
        R();
        q = 16;
        break;
      }
    }
  }

  void q16() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        R();
        q = 16;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('B');
        R();
        q = 25;
        break;
      }
    }
  }

  void q17() {
    switch(tape[activeIndex].getContent()) {
      case '1': {
        tape[activeIndex].setContent('1');
        L();
        q = 18;
        break;
      }
    }
  }

  void q18() {
    switch(tape[activeIndex].getContent()) {
      case 'B': {
        tape[activeIndex].setContent('B');
        L();
        q = 18;
        break;
      }
      case '0': {
        tape[activeIndex].setContent('0');
        L();
        q = 18;
        break;
      }
      case 'X': {
        tape[activeIndex].setContent('X');
        R();
        q = 19;
        break;
      }
    }
  }

  void q19() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        R();
        q = 19;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('0');
        R();
        q = 20;
        break;
      }
    }
  }

  void q20() {
    switch(tape[activeIndex].getContent()) {
      case 'B': {
        tape[activeIndex].setContent('B');
        R();
        q = 20;
        break;
      }
      case '1': {
        tape[activeIndex].setContent('B');
        R();
        q = 21;
        break;
      }
      case '0': {
        tape[activeIndex].setContent('B');
        L();
        q = 18;
        break;
      }
    }
  }

  void q21() {
    switch(tape[activeIndex].getContent()) {
      case 'X': {
        tape[activeIndex].setContent('B');
        R();
        q = 22;
        break;
      }
    }
  }

  void q22() {
    switch(tape[activeIndex].getContent()) {
      case 'B': {
        tape[activeIndex].setContent('B');
        R();
        q = 25;
        break;
      }
    }
  }

  void q23() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        R();
        q = 23;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('B');
        R();
        q = 25;
        break;
      }
    }
  }

  void q24() {
    switch(tape[activeIndex].getContent()) {
      case '0': {
        tape[activeIndex].setContent('0');
        R();
        q = 24;
        break;
      }
      case 'B': {
        tape[activeIndex].setContent('B');
        R();
        q = 25;
        break;
      }
    }
  }

  void q25() {
    int xCount = tape.where((item) => item.getContent() == 'X').toList().length;
    int yCount = tape.where((item) => item.getContent() == 'Y').toList().length;
    hasil = tape.where((item) => item.getContent() == '0').toList().length;
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

  void R() {
    tape[activeIndex].setIsCurrent(false);
    activeIndex++;
    jumpToItem();
    tape[activeIndex].setIsCurrent(true);
  }

  void L() {
    tape[activeIndex].setIsCurrent(false);
    activeIndex--;
    jumpToItem();
    tape[activeIndex].setIsCurrent(true);
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }
}