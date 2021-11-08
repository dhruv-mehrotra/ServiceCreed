import 'package:flutter/material.dart';
import 'package:service_creed/enums/viewstate.dart';
import 'package:service_creed/locator.dart';
import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/services/api/services_api.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class ServicesViewModel extends BaseViewModel {
  ServicesApi _servicesApi = locator<ServicesApi>();
  List<ServiceCategory> _categories;
  List<ServiceCategory> get categories => _categories;
  set categories(List<ServiceCategory> categories) {
    _categories = categories;
    notifyListeners();
  }

  void onModelReady() async {
    try {
      setState(ViewState.Busy);
      categories = await _servicesApi.getServiceCategories();
      debugPrint('success');
      setState(ViewState.Idle);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
