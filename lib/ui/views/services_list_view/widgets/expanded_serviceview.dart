import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_creed/models/service_model.dart';

class ExpandedSeviceviewWidget extends StatelessWidget {
  final Service service;
  const ExpandedSeviceviewWidget({
    @required this.service,
  });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(7.w),
//         alignment: Alignment.center,
//         child: ListView(
//           children: [
//             SizedBox(height: 27.28.h),
//             RichText(
//               text: TextSpan(
//                 text: "",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 18.sp,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(height: 15.h),
//             ListView.separated(
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               itemBuilder: (BuildContext context, int index) {
//                 return IntrinsicHeight(
//                   child: Container(
//                     color: Colors.white,
//                     width: 340.w,
//                     child: _expandedServiceCard(),
//                   ),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return SizedBox(
//                   height: 23.82.h,
//                 );
//               },
//               itemCount: 5,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _expandedServiceCard() {
//   return IntrinsicHeight(
//     child: Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(4.sp),
//       ),
//       elevation: 4.h,
//       child: Padding(
//         padding: EdgeInsets.all(10.h),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 16.h,
//               ),
//               Row(children: [
//                 SizedBox(
//                   height: 19.h,
//                   width: 19.w,
//                   child: Container(),
//                 ),
//                 SizedBox(
//                   width: 7.w,
//                 ),
//                 RichText(
//                     overflow: TextOverflow.ellipsis,
//                     text: TextSpan(
//                       text: "",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 12.sp,
//                         color: Color(0xFF252423),
//                       ),
//                     )),
//               ]),
//               SizedBox(
//                 height: 9.4.h,
//               ),
//               RichText(
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 100,
//                   text: TextSpan(
//                     text: "",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w300,
//                       fontSize: 16.sp,
//                       color: Colors.black,
//                     ),
//                   )),
//               SizedBox(
//                 height: 15.h,
//               ),
//             ]),
//       ),
//     ),
//   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              service.serviceName,
              style: TextStyle(color: Colors.white),
            ),
            background: Image.asset(
              service.category.url,
              fit: BoxFit.fill,
            ),
            centerTitle: true,
          ),
          centerTitle: true,
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        SliverFillRemaining(
          child: Container(),
        ),
      ],
    ));
  }
}
