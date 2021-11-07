import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class ServicesViewModel extends BaseViewModel {
  List<ServiceCategory> get serviceCategories => _categories;

  List<ServiceCategory> _categories = <ServiceCategory>[
    ServiceCategory(
      label: 'Plumber',
      url: 'assets/images/plumber.png',
    ),
    ServiceCategory(
      label: 'Electrical maintenance',
      url: 'assets/images/electrical_maintenance.jpg',
    ),
    ServiceCategory(
      label: 'Domestic help',
      url: 'assets/images/domestic_help.jpg',
    ),
    ServiceCategory(
      label: 'Personal Care',
      url: 'assets/images/personal_care.jpg',
    ),
    ServiceCategory(
      label: 'Car Maintenance',
      url: 'assets/images/car_maintenance.jpg',
    ),
    ServiceCategory(
      label: 'Others',
      url: 'assets/images/miscellaneous_services.jpg',
    ),
  ];
}
