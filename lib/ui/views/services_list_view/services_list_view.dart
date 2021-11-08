import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/views/services_list_view/widgets/service_category_view.dart';
import 'package:service_creed/viewmodels/services_list/services_list_viewmodel.dart';

class ServicesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ServicesListViewmodel>(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(child: _servicesListWidget()),
      ),
    );
  }
}

Widget _servicesListWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
    child: ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return _serviceCategoryCard(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10.h);
      },
    ),
  );
}

Widget _serviceCategoryCard(int index) {
  return GestureDetector(
    onTap: () => {ServiceCategoryView()},
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.deepPurple, // red as border color
        ),
      ),
      width: 328.w,
      height: 76.h,
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
          ),
          SizedBox(
            height: 60.h,
            width: 60.h,
            child: Container(),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Service Number $index',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 16.sp)),
              ),
              SizedBox(
                height: 5.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Description',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 12.sp)),
              ),
              SizedBox(
                height: 3.h,
              ),
              RichText(
                text: TextSpan(
                    text: 'Further Description',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 12.sp)),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
