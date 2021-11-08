import 'package:flutter/material.dart';
import 'package:service_creed/models/service_model.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/views/services_list_view/widgets/expanded_serviceview.dart';
import 'package:service_creed/viewmodels/service_provider_list/service_provider_list_viewmodel.dart';

class ServiceProviderListWidget extends StatelessWidget {
  final Service service;
  const ServiceProviderListWidget({
    @required this.service,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ServiceProviderListViewModel>(
      onModelReady: (ServiceProviderListViewModel model) =>
          model.onModelReady(service),
      builder: (BuildContext context, ServiceProviderListViewModel model,
              Widget child) =>
          Scaffold(
        appBar: AppBar(
          title: Text(service.serviceName),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: model.serviceProviders.length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: ListTile(
              title: Text(
                model.serviceProviders[index].fullName,
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ExpandedSeviceviewWidget(
                    serviceProvider: model.serviceProviders[index],
                  ),
                ),
              ),
            ),
          ),
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
