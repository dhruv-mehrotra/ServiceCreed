import 'package:flutter/material.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class PaymentViewModel extends BaseViewModel {
  List<String> choices = [
    'Debit Card/Credit Card',
    'Cash on Delivery',
  ];
  TextEditingController _cardNoController;
  TextEditingController _cvvController;
  TextEditingController _addressController;

  TextEditingController get cardNoController => _cardNoController;
  TextEditingController get cvvController => _cvvController;
  TextEditingController get addressController => _addressController;

  set cardNoController(TextEditingController cardNoController) {
    _cardNoController = cardNoController;
    notifyListeners();
  }

  set cvvController(TextEditingController cvvController) {
    _cvvController = cvvController;
    notifyListeners();
  }

  set addressController(TextEditingController addressController) {
    _addressController = addressController;
    notifyListeners();
  }

  String _chosenValue = 'Debit Card/Credit Card';

  String get chosenValue => _chosenValue;

  set chosenValue(String value) {
    _chosenValue = value;
    notifyListeners();
  }

  void onModelReady() {
    cardNoController = TextEditingController();
    cvvController = TextEditingController();
    addressController = TextEditingController();
  }

  void onModelDestroy() {
    cardNoController.dispose();
    cvvController.dispose();
    addressController.dispose();
  }
}
