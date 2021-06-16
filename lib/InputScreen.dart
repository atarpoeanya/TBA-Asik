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
  final formKey = GlobalKey<FormState>();
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (this.widget.type == 1) {
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
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A + B',
                  textAlign: TextAlign.center,
                ),
                bilanganA(),
                bilanganB(),
                TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              type: this.widget.type,
                              A: int.parse(_controllerA.text),
                              B: int.parse(_controllerB.text),
                            ),
                          ));
                    }
                  },
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (this.widget.type == 2) {
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
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A - B',
                  textAlign: TextAlign.center,
                ),
                bilanganA(),
                bilanganB(),
                TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              type: this.widget.type,
                              A: int.parse(_controllerA.text),
                              B: int.parse(_controllerB.text),
                            ),
                          ));
                    }
                  },
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (this.widget.type == 3) {
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
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A * B',
                  textAlign: TextAlign.center,
                ),
                bilanganA(),
                bilanganB(),
                TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              type: this.widget.type,
                              A: int.parse(_controllerA.text),
                              B: int.parse(_controllerB.text),
                            ),
                          ));
                    }
                  },
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (this.widget.type == 4) {
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
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A / B',
                  textAlign: TextAlign.center,
                ),
                bilanganA(),
                bilanganB(),
                TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              type: this.widget.type,
                              A: int.parse(_controllerA.text),
                              B: int.parse(_controllerB.text),
                            ),
                          ));
                    }
                  },
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (this.widget.type == 5) {
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
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A!',
                  textAlign: TextAlign.center,
                ),
                bilanganA(),
                TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              type: this.widget.type,
                              A: int.parse(_controllerA.text),
                              B: -1,
                            ),
                          ));
                    }
                  },
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (this.widget.type == 6) {
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
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A % B',
                  textAlign: TextAlign.center,
                ),
                bilanganA(),
                bilanganB(),
                TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              type: this.widget.type,
                              A: int.parse(_controllerA.text),
                              B: int.parse(_controllerB.text),
                            ),
                          ));
                    }
                  },
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (this.widget.type == 7) {
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
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A ^ B',
                  textAlign: TextAlign.center,
                ),
                bilanganA(),
                bilanganB(),
                TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              type: this.widget.type,
                              A: int.parse(_controllerA.text),
                              B: int.parse(_controllerB.text),
                            ),
                          ));
                    }
                  },
                  child: const Text('Lanjut'),
                ),
              ],
            ),
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
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'log\u{2082}A',
                  textAlign: TextAlign.center,
                ),
                bilanganA(),
                TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              type: this.widget.type,
                              A: int.parse(_controllerA.text),
                              B: -1,
                            ),
                          ));
                    }
                  },
                  child: const Text('Lanjut'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget bilanganA() => TextFormField(
        controller: _controllerA,
        keyboardType: TextInputType.numberWithOptions(
          signed: true,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
        ],
        decoration: InputDecoration(
          hintText: 'Masukkan bilangan A',
          labelText: 'Bilangan A',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null) {
            return 'Masukkan bilangan A';
          } else {
            int? a = int.tryParse(value);
            if (a == null) {
              return 'Masukkan bilangan yang valid';
            } else {
              return null;
            }
          }
        },
      );

  Widget bilanganB() => TextFormField(
        controller: _controllerB,
        keyboardType: TextInputType.numberWithOptions(
          signed: true,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[\d+\-]')),
        ],
        decoration: InputDecoration(
          hintText: 'Masukkan bilangan B',
          labelText: 'Bilangan B',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null) {
            return 'Masukkan bilangan B';
          } else {
            int? b = int.tryParse(value);
            if (b == null) {
              return 'Masukkan bilangan yang valid';
            } else {
              return null;
            }
          }
        },
      );

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    super.dispose();
  }
}
