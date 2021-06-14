import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tubes/model/Item.dart';

class STMModuloScreen extends StatefulWidget {
  final String A, B;
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
  List<Item> list = [];
  int activeIndex = 3;
  double padding = 16.0;
  int total = 0;
  bool done = false;
  int q = 0;
  String hasil = '0';
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
      list.add(
        Item('-1', false)
      );
      activeIndex++;
    }

    int A = int.parse(this.widget.A);
    int B = int.parse(this.widget.B);

    list.add(
      Item('B', false)
    );
    list.add(
      Item('B', false)
    );
    list.add(
      Item('B', false)
    );
    
    if(A < 0) {
      list.add(
        Item('Y', false)
      );
      int tempA = A * -1;
      for(int i = 0; i < tempA; i++) {
        list.add(
          Item('0', false)
        );
      }
    } else if(A > 0) {
      list.add(
        Item('X', false)
      );
      for(int i = 0; i < A; i++) {
        list.add(
          Item('0', false)
        );
      }
    }

    list.add(
      Item('1', false)
    );
    
    if(B < 0) {
      list.add(
        Item('Y', false)
      );
      int tempB = B * -1;
      for(int i = 0; i < tempB; i++) {
        list.add(
          Item('0', false)
        );
      }
    } else if(B > 0) {
      list.add(
        Item('X', false)
      );
      for(int i = 0; i < B; i++) {
        list.add(
          Item('0', false)
        );
      }
    }

    list.add(
      Item('B', false)
    );
    list.add(
      Item('B', false)
    );
    list.add(
      Item('B', false)
    );

    for(int i = 0; i < (total - 2) / 2; i++) {
      list.add(
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
            Text(this.widget.A + ' % ' + this.widget.B),
            Container(
              margin: EdgeInsets.only(
                top: 16.0,
              ),
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                controller: controller,
                itemBuilder: (context, index) {
                  if(list[index].getContent() == '-1') {
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
                          list[index].getContent(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: list[index].getIsCurrent() == true ? Colors.lightBlue : Colors.lightGreen,
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
                  list[activeIndex].setIsCurrent(true);
                  jumpToItem();
                  q = 0;               
                });
                runTM();
              },
              child: const Text('Proses'),
            ),
            Text('Hasil:'),
            Text(done ? hasil : ''),
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
          } else if(q == 26) {
            q26();
          } else if(q == 27) {
            q27();
          } else if(q == 28) {
            q28();
          } else if(q == 29) {
            q29();
          } else if(q == 30) {
            q30();
          } else if(q == 31) {
            q31();
          } else if(q == 32) {
            q32();
          } else if(q == 33) {
            q33();
          } else if(q == 34) {
            q34();
          } else if(q == 35) {
            q35();
          } else if(q == 36) {
            q36();
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  void q0() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q1() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q2() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q3() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q4() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q5() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q6() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q7() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q8() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q9() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q10() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q11() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q12() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q13() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q14() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q15() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q16() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q17() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q18() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q19() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q20() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q21() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q22() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q23() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q24() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q25() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q26() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q27() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q28() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q29() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q30() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q31() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q32() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q33() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q34() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q35() {
    switch(list[activeIndex].getContent()) {
      case '': {
        list[activeIndex].setContent('');
        ();
        q = ;
        break;
      }
    }
  }

  void q36() {
    int xCount = list.where((item) => item.getContent() == 'X').toList().length;
    int yCount = list.where((item) => item.getContent() == 'Y').toList().length;
    int zeroCount = list.where((item) => item.getContent() == '0').toList().length;
    if(xCount == 1 && yCount == 1) {
      hasil = 'Tidak dapat diselesaikan';
    } else if(xCount == 1) {
      hasil = zeroCount.toString();
    } else {
      hasil = '0';
    }
    q = -1;
    done = true;
  }

  void R() {
    list[activeIndex].setIsCurrent(false);
    activeIndex++;
    jumpToItem();
    list[activeIndex].setIsCurrent(true);
  }

  void L() {
    list[activeIndex].setIsCurrent(false);
    activeIndex--;
    jumpToItem();
    list[activeIndex].setIsCurrent(true);
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }
}