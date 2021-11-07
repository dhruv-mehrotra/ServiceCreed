import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_creed/ui/views/services_list_view/widgets/service_post_card.dart';

class ServiceCategoryView extends StatelessWidget {
  const ServiceCategoryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: _servicesListWidget(),
    );
  }
}

Widget _servicesListWidget() {
  return ListView.separated(
    shrinkWrap: true,
    itemCount: 5,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      return ServicePostCard();
    },
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 14.h);
    },
  );
}
