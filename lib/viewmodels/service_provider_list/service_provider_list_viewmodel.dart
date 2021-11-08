import 'package:flutter/material.dart';
import 'package:service_creed/enums/viewstate.dart';
import 'package:service_creed/locator.dart';
import 'package:service_creed/models/service_model.dart';
import 'package:service_creed/models/service_provider_model.dart';
import 'package:service_creed/services/api/services_api.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class ServiceProviderListViewModel extends BaseViewModel {
  ServicesApi _servicesApi = locator<ServicesApi>();
  List<ServiceProvider> _serviceProvider;

  List<ServiceProvider> get serviceProviders => _serviceProvider;

  set serviceProviders(List<ServiceProvider> serviceProvider) {
    _serviceProvider = serviceProvider;
    notifyListeners();
  }

  void onModelReady(Service service) async {
    try {
      setState(ViewState.Busy);
      serviceProviders =
          await _servicesApi.getServiceProvider(service.serviceId);
      debugPrint('success');
      setState(ViewState.Idle);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
