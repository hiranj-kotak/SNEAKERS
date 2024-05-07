import "package:flutter/foundation.dart";

import "../shoes.dart";

class ProductProvider with ChangeNotifier {
  Shoes? product;

  void notify() {
    notifyListeners();
  }
}
