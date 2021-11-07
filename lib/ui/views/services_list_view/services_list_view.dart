import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/views/services_list_view/widgets/service_post_card.dart';
import 'package:service_creed/viewmodels/services_list/services_list_viewmodel.dart';

class ServicesListWidget extends StatelessWidget {
  const ServicesListWidget({
    Key key,
    @required this.category,
  }) : super(key: key);
  final ServiceCategory category;

  @override
  Widget build(BuildContext context) {
    return BaseView<ServicesListViewmodel>(
      onModelReady: (ServicesListViewmodel model) =>
          model.onModelReady(category),
      builder:
          (BuildContext context, ServicesListViewmodel model, Widget chuild) {
        return Scaffold(
          appBar: AppBar(
            title: Text(category.label),
            centerTitle: true,
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: model.services.length,
            itemBuilder: (BuildContext context, int index) => ServicePostCard(
              service: model.services[index],
            ),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
          ),
        );
      },
    );
  }
}
