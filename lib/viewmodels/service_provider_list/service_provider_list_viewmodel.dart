import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/models/service_model.dart';
import 'package:service_creed/models/service_provider_model.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class ServiceProviderListViewModel extends BaseViewModel {
  Service _service;

  void onModelReady(Service service) {
    _service = service;
  }

  List<ServiceProvider> get serviceProviders => <ServiceProvider>[
        ServiceProvider(
          service: _service,
          cost: 200,
          name: 'Anand',
        ),
        ServiceProvider(
          service: _service,
          cost: 200,
          name: 'Anand',
        ),
        ServiceProvider(
          service: _service,
          cost: 200,
          name: 'Anand',
        ),
        ServiceProvider(
          service: _service,
          cost: 200,
          name: 'Anand',
        ),
        ServiceProvider(
          service: _service,
          cost: 200,
          name: 'Anand',
        ),
      ];
}
