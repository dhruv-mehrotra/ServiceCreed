import 'package:flutter/material.dart';
import 'package:service_creed/ui/views/search_view/map_view.dart';

class SearchHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            List<String> services = [
              "Plumber",
              "Electrical Maintenance",
              "Domestic Help",
              "Personal Care",
              "Car Maintenance",
              "Others"
            ];
            final service = services[index];
            return ListTile(
              title: Text(service),
              leading: CircleAvatar(
                child: Text(service.substring(0, 1)),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapView(service: service)));
              },
              subtitle: Text("Click to view"),
            );
          },
        );
      }),
    );
  }
}
