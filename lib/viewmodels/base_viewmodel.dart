import 'package:service_creed/enums/viewstate.dart';
import 'package:flutter/foundation.dart';
import 'package:service_creed/locator.dart';
import 'package:service_creed/services/local_storage_service.dart';

/// for all the model state management logic

class BaseViewModel extends ChangeNotifier {
  LocalStorageService _localStorageService = locator<LocalStorageService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  String get token => _localStorageService.token;
  void set token(String token) {
    _localStorageService.token = token;
    notifyListeners();
  }
}
