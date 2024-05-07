import 'package:sneakers/shoes.dart';
import 'package:flutter/material.dart';

class searchList extends ChangeNotifier {
  List<Shoes> sneaks = [];
  bool _isloading = true;
  void notify() {
    notifyListeners();
  }

  void add(Shoes shoe) {
    sneaks.add(shoe);
  }

  void setLoading() {
    _isloading = true;
    notify();
  }

  void removeLoading() {
    _isloading = false;
    notify();
  }

  bool loading() {
    return _isloading;
  }
}
