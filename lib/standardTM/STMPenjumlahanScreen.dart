import 'package:flutter/material.dart';
import 'package:tubes/model/Item.dart';

class STMPenjumlahanScreen extends StatefulWidget {
  final String A, B;
  final double width;

  STMPenjumlahanScreen({
    required this.A,
    required this.B,
    required this.width,
  });

  _STMPenjumlahanScreen createState() => _STMPenjumlahanScreen();
}

class _STMPenjumlahanScreen extends State<STMPenjumlahanScreen> {
  final controller = ScrollController();
  List<Item> list = [];
  bool xIsPlus = true;
  int activeIndex = 3;
  double padding = 16.0;
  int total = 0;
  bool finish = false;

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
        Item('X', false)
      );
      xIsPlus = false;
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
      xIsPlus = true;
      for(int i = 0; i < A; i++) {
        list.add(
          Item('0', false)
        );
      }
    }

    list.add(
      Item('1', false)
    );
    
    if(B < 0 && xIsPlus) {
      list.add(
        Item('Y', false)
      );
      int tempB = B * -1;
      for(int i = 0; i < tempB; i++) {
        list.add(
          Item('0', false)
        );
      }
    } else if(B < 0 && !xIsPlus) {
      list.add(
        Item('X', false)
      );
      int tempB = B * -1;
      for(int i = 0; i < tempB; i++) {
        list.add(
          Item('0', false)
        );
      }
    } else if(B > 0 && xIsPlus) {
      list.add(
        Item('X', false)
      );
      for(int i = 0; i < B; i++) {
        list.add(
          Item('0', false)
        );
      }
    } else if(B < 0 && !xIsPlus) {
      list.add(
        Item('Y', false)
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
            Text(this.widget.A + ' + ' + this.widget.B),
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
                if(!finish) {
                  setState(() {
                    finish = true;
                    list[activeIndex].setIsCurrent(true);
                    jumpToItem();
                    q0();
                  });
                }
              },
              child: const Text('Proses'),
            ),
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

  void q0() {
    switch(list[activeIndex].getContent()) {
      case 'X': {
        list[activeIndex].setContent('X');
        list[activeIndex].setIsCurrent(false);
        activeIndex++;
        jumpToItem();
        q1();
        break;
      }
      case '1': {
        list[activeIndex].setContent('B');
        list[activeIndex].setIsCurrent(false);
        activeIndex++;
        jumpToItem();
        q13();
        break;
      }
    }
  }

  void q1() {
    switch(list[activeIndex].getContent()) {
      case '0': {
        list[activeIndex].setContent('B');
        list[activeIndex].setIsCurrent(false);
        activeIndex++;
        jumpToItem();
        q2();
        break;
      }
      case '1': {
        list[activeIndex].setContent('B');
        list[activeIndex].setIsCurrent(false);
        activeIndex--;
        jumpToItem();
        q8();
        break;
      }
    }
  }

  void q2() {

  }

  void q3() {

  }

  void q4() {

  }

  void q5() {

  }

  void q6() {

  }

  void q7() {

  }

  void q8() {

  }

  void q9() {

  }

  void q10() {

  }

  void q11() {

  }

  void q12() {

  }

  void q13() {

  }

  void q14() {

  }

  void q15() {

  }

  void q16() {

  }

  void q17() {

  }

  void q18() {

  }

  void q19() {

  }

  void q20() {

  }

  void q21() {

  }

  void q22() {

  }

  void q23() {

  }

  void q24() {

  }

  void q25() {

  }
}