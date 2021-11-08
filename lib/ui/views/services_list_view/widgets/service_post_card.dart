import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_creed/models/service_model.dart';
import 'package:service_creed/ui/views/service_provider_list.dart/service_provider_list_widget.dart';

class ServicePostCard extends StatelessWidget {
  final Service service;

  const ServicePostCard({
    @required this.service,
  });

  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.account_circle,
            ),
          ),
          title: Text(service.serviceName),
          subtitle: Text(service.category.label),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  ServiceProviderListWidget(service: service),
            ),
          ),
        ),
      );
}
