import 'package:flutter/foundation.dart';

class AddCar with ChangeNotifier {
  bool _delete = false;
  final List<List<String>> _carsdata = [];
  bool get delete => _delete;
  List<String> _cars = [];
  List<String> get cars => _cars;
  List<List<String>> get carsdata => _carsdata;
  void addCar(data) {
    _cars = data;
    _carsdata.add(_cars);
    notifyListeners();
  }

  void deletecheck(val) {
    if (val == true) {
      _delete = val;
      notifyListeners();
    }
    _delete = val;
  }
}
