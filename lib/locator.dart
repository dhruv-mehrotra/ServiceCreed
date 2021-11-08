import 'package:get_it/get_it.dart';
import 'package:service_creed/services/api/authentication_api.dart';
import 'package:service_creed/services/api/services_api.dart';
import 'package:service_creed/services/local_storage_service.dart';
import 'package:service_creed/viewmodels/Auth/login_viewmodel.dart';
import 'package:service_creed/viewmodels/Auth/register_viewmodel.dart';
import 'package:service_creed/viewmodels/Payment/payment_viewmodel.dart';
import 'package:service_creed/viewmodels/Primary/primary_viewmodel.dart';
import 'package:service_creed/viewmodels/Services/services_viewmodel.dart';
import 'package:service_creed/viewmodels/service_provider_list/service_provider_list_viewmodel.dart';
import 'package:service_creed/viewmodels/services_list/services_list_viewmodel.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<LocalStorageService>(
    await LocalStorageService.getInstance(),
  );
  locator.registerSingleton(ServicesApi());
  locator.registerSingleton<AuthenticationApi>(AuthenticationApi());
  locator.registerFactory<PaymentViewModel>(() => PaymentViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<RegisterViewModel>(() => RegisterViewModel());
  locator.registerFactory<PrimaryViewModel>(() => PrimaryViewModel());
  locator.registerFactory<ServicesViewModel>(() => ServicesViewModel());

  locator.registerFactory<ServiceProviderListViewModel>(
      () => ServiceProviderListViewModel());
  locator.registerFactory<ServicesListViewmodel>(() => ServicesListViewmodel());
}
