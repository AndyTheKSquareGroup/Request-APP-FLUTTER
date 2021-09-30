// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:requestsflutter/screens/detail.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';

// class Test extends StatelessWidget {
//   // const MyDesingWidget({Key? key}) : super(key: key);
//   final String JsonImg;
//   final String JsonTitle;
//   final String JsonDesc;
//   final String JsonContent;
//   final String JsonModified;
//   const Test({
//     this.JsonImg = "",
//     this.JsonTitle = "",
//     this.JsonDesc = "",
//     this.JsonContent = "",
//     this.JsonModified = "",
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextButton(
//         onPressed: () {
//           Get.to(ContactDetail(
//             JsonTitle: JsonTitle,
//             JsonContentImg: JsonImg,
//             JsonContentDesc: JsonDesc,
//             JsonMod: JsonModified,
//           ));
//         },
//         child: Row(
//           children: [
//             Container(
//               width: 150,
//               child: Image.network(
//                 JsonImg,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Container(
//                   // color: Colors.red,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         JsonTitle,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         JsonDesc,
//                         style: TextStyle(color: Colors.black54, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
