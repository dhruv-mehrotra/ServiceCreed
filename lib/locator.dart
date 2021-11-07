import 'package:get_it/get_it.dart';
import 'package:service_creed/viewmodels/Primary/primary_viewmodel.dart';
import 'package:service_creed/viewmodels/Services/services_viewmodel.dart';
import 'package:service_creed/viewmodels/services_list/services_list_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<PrimaryViewModel>(() => PrimaryViewModel());
  locator.registerFactory<ServicesViewModel>(() => ServicesViewModel());
  locator.registerFactory(() => ServicesListViewmodel());
}
