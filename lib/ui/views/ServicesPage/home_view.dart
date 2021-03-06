import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:service_creed/enums/viewstate.dart';
import 'package:service_creed/models/service_category.dart';
import 'package:service_creed/ui/views/ServicesPage/components/grid_item.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/viewmodels/Services/services_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ServicesViewModel>(
      onModelReady: (model) => model.onModelReady(),
      builder: (BuildContext context, ServicesViewModel model, Widget child) =>
          model.state == ViewState.Idle
              ? AnimationLimiter(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                    ),
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.categories.length,
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (BuildContext context, int index) {
                      ServiceCategory category = model.categories[index];
                      return AnimationConfiguration.staggeredGrid(
                        duration: const Duration(milliseconds: 700),
                        position: index,
                        columnCount: 2,
                        child: SlideAnimation(
                          child: FadeInAnimation(
                            child: GridItem(
                              category: category,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
