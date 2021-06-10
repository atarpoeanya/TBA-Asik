import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tubes/SelectScreen.dart';

class InputScreen extends StatefulWidget {
  final int type;

  InputScreen({
    required this.type,
  });

  @override
  _InputScreen createState() => _InputScreen();
}

class _InputScreen extends State<InputScreen> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(this.widget.type == 1) {
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
            'Penjumlahan',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A + B',
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerA,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan A',
                  labelText: 'Bilangan A',
                ),
              ),
              TextField(
                controller: _controllerB,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan B',
                  labelText: 'Bilangan B',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        type: this.widget.type,
                        A: _controllerA.text,
                        B: _controllerB.text,
                      ),
                    )
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      );
    } else if(this.widget.type == 2) {
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
            'Pengurangan',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A - B',
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerA,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan A',
                  labelText: 'Bilangan A',
                ),
              ),
              TextField(
                controller: _controllerB,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan B',
                  labelText: 'Bilangan B',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        type: this.widget.type,
                        A: _controllerA.text,
                        B: _controllerB.text,
                      ),
                    )
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      );
    } else if(this.widget.type == 3) {
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
            'Perkalian',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A * B',
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerA,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan A',
                  labelText: 'Bilangan A',
                ),
              ),
              TextField(
                controller: _controllerB,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan B',
                  labelText: 'Bilangan B',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        type: this.widget.type,
                        A: _controllerA.text,
                        B: _controllerB.text,
                      ),
                    )
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      );
    } else if(this.widget.type == 4) {
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
            'Pembagian',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A / B',
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerA,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan A',
                  labelText: 'Bilangan A',
                ),
              ),
              TextField(
                controller: _controllerB,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan B',
                  labelText: 'Bilangan B',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        type: this.widget.type,
                        A: _controllerA.text,
                        B: _controllerB.text,
                      ),
                    )
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      );
    } else if(this.widget.type == 5) {
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
            'Faktorial',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A!',
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerA,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan A',
                  labelText: 'Bilangan A',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        type: this.widget.type,
                        A: _controllerA.text,
                        B: '',
                      ),
                    )
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      );
    } else if(this.widget.type == 6) {
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
            'Modulo',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A % B',
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerA,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan A',
                  labelText: 'Bilangan A',
                ),
              ),
              TextField(
                controller: _controllerB,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan B',
                  labelText: 'Bilangan B',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        type: this.widget.type,
                        A: _controllerA.text,
                        B: _controllerB.text,
                      ),
                    )
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      );
    } else if(this.widget.type == 7) {
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
            'Pangkat',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'A ^ B',
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerA,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan A',
                  labelText: 'Bilangan A',
                ),
              ),
              TextField(
                controller: _controllerB,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan B',
                  labelText: 'Bilangan B',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        type: this.widget.type,
                        A: _controllerA.text,
                        B: _controllerB.text,
                      ),
                    )
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      );
    } else {
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
            'Logaritma biner',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'log\u{2082}A',
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _controllerA,
                keyboardType: TextInputType.numberWithOptions(
                  signed: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: 'Masukkan bilangan A',
                  labelText: 'Bilangan A',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        type: this.widget.type,
                        A: _controllerA.text,
                        B: '',
                      ),
                    )
                  );
                },
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    super.dispose();
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(!newValue.text.contains('-')) {
      return newValue;
    }
    String first = newValue.text[0];
    String second = newValue.text[1];
    String text = newValue.text;
    if(first == '-' && second == '0') {
      text = '0';
    } else if(first == '-' && second != '0'){
      text = '-' + newValue.text.replaceAll('-', '');
    } else {
      text = newValue.text.replaceAll('-', '');
    }

    return TextEditingValue(text: text, selection: TextSelection.collapsed(offset: text.length), composing: newValue.composing);
  }
}