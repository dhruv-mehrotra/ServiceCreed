import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_creed/ui/views/search_view/map_view.dart';
import 'package:service_creed/viewmodels/nearby_services/user_model.dart';

class SearchHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        //final location = Provider.of<UserLocationModel>(context);

        // if (location.homeState == HomeState.Loading) {
        //   return Center(child: CircularProgressIndicator());
        // }
        // if (location.homeState == HomeState.Error) {
        //   return Center(child: Text('An Error Occured'));
        // }a
        //final position = location.position;
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
