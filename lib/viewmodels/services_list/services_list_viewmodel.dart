import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/models/service_model.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class ServicesListViewmodel extends BaseViewModel {
  ServiceCategory _category;

  List<Service> get services => <Service>[
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Somedescription',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
        Service(
          serviceId: 1,
          serviceName: 'Some Service',
          category: _category,
          description: 'Some description',
        ),
      ];

  void onModelReady(ServiceCategory category) {
    _category = category;
  }
}
