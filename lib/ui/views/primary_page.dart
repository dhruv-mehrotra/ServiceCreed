import 'package:flutter/material.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/viewmodels/Primary/primary_viewmodel.dart';

class PrimaryPage extends StatelessWidget {
  const PrimaryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PrimaryViewModel>(
      builder: (BuildContext context, PrimaryViewModel model, Widget child) =>
          Scaffold(
        appBar: AppBar(
          title: Text(model.titles[model.selectedIndex]),
          centerTitle: true,
          backgroundColor: model.backGroundColor[model.selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: model.selectedIndex,
          onTap: (int index) => model.selectedIndex = index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'Services',
              backgroundColor: model.backGroundColor[0],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_walk),
              label: 'Walk-In-Service',
              backgroundColor: model.backGroundColor[1],
            ),
          ],
        ),
        body: model.pages[model.selectedIndex],
      ),
    );
  }
}
