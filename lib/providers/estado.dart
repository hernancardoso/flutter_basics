import 'package:flutter/material.dart';

class Estado with ChangeNotifier {
  var _notifications = false;

  get notifications {
    return _notifications;
  }

  set notifications(newValue) {
    _notifications = newValue;
    notifyListeners();
  }
}
