import 'package:flutter/material.dart';

class Item extends ChangeNotifier {
  Item(this._content, this._isCurrent);

  String _content;
  bool _isCurrent;

  String getContent() {
    return _content;
  }

  bool getIsCurrent() {
    return _isCurrent;
  }

  void setContent(String content) {
    _content = content;
    notifyListeners();
  }

  void setIsCurrent(bool isCurrent) {
    _isCurrent = isCurrent;
    notifyListeners();
  }
}