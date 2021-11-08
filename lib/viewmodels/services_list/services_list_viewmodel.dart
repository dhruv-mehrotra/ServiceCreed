import 'package:flutter/material.dart';
import 'package:service_creed/enums/viewstate.dart';
import 'package:service_creed/locator.dart';
import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/models/service_model.dart';
import 'package:service_creed/services/api/services_api.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class ServicesListViewmodel extends BaseViewModel {
  ServicesApi _servicesApi = locator<ServicesApi>();
  List<Service> _services;

  set services(List<Service> services) {
    _services = services;
    notifyListeners();
  }

  List<Service> get services => _services;

  void onModelReady(ServiceCategory category) async {
    try {
      setState(ViewState.Busy);
      services = await _servicesApi.getService(category.id);
      debugPrint('success');
      setState(ViewState.Idle);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
