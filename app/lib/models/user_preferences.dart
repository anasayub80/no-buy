import 'package:flutter/foundation.dart';

class UserPreferences extends ChangeNotifier {
  String _intention;
  String _currency;
  String _hourlyRate;
  bool _remindersEnabled;

  UserPreferences({
    String intention = 'Spend with intention',
    String currency = 'USD',
    String hourlyRate = '18',
    bool remindersEnabled = true,
  })  : _intention = intention,
        _currency = currency,
        _hourlyRate = hourlyRate,
        _remindersEnabled = remindersEnabled;

  String get intention => _intention;
  set intention(String value) {
    if (_intention != value) {
      _intention = value;
      notifyListeners();
    }
  }

  String get currency => _currency;
  set currency(String value) {
    if (_currency != value) {
      _currency = value;
      notifyListeners();
    }
  }

  String get hourlyRate => _hourlyRate;
  set hourlyRate(String value) {
    if (_hourlyRate != value) {
      _hourlyRate = value;
      notifyListeners();
    }
  }

  bool get remindersEnabled => _remindersEnabled;
  set remindersEnabled(bool value) {
    if (_remindersEnabled != value) {
      _remindersEnabled = value;
      notifyListeners();
    }
  }
}
