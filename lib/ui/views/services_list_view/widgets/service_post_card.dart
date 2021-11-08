import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_creed/models/service_model.dart';
import 'package:service_creed/ui/views/service_provider_list.dart/service_provider_list_widget.dart';

class ServicePostCard extends StatelessWidget {
  final Service service;

  const ServicePostCard({
    @required this.service,
  });
//   @override
//   Widget build(BuildContext context) => buildPost(context);

//   Widget buildPost(BuildContext context) => GestureDetector(
//         onTap: () => {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ExpandedSeviceviewWidget()))
//         },
//         onLongPress: null,
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24.sp),
//           ),
//           elevation: 6.h,
//           child: Container(
//             color: Colors.white,
//             padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
//             child: Row(
//               children: [
//                 SizedBox(width: 15.w),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: 25.sp,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       _serviceInfoCard(),
//                       SizedBox(height: 10.h),
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: []),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
// }

// Widget _serviceInfoCard() {
//   return IntrinsicHeight(
//     child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 16.h,
//           ),
//           Row(children: [
//             SizedBox(
//               height: 19.h,
//               width: 19.w,
//               child: Container(),
//             ),
//             SizedBox(
//               width: 7.w,
//             ),
//             RichText(
//                 overflow: TextOverflow.ellipsis,
//                 text: TextSpan(
//                   text: "",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 12.sp,
//                     color: Color(0xFF252423),
//                   ),
//                 )),
//           ]),
//           SizedBox(
//             height: 9.4.h,
//           ),
//           RichText(
//               overflow: TextOverflow.ellipsis,
//               maxLines: 2,
//               text: TextSpan(
//                 text: "",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w300,
//                   fontSize: 16.sp,
//                   color: Colors.black,
//                 ),
//               )),
//           SizedBox(
//             height: 15.h,
//           ),
//         ]),
//   );

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
