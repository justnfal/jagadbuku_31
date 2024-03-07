import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);
  // creating static data in lists

  List catNames = [
    "Category",
    'Classes',
    'Free Course',
    'BookStore',
    'Live Course',
    'LeaderBoard',
  ];

  List<Color> catColors = [
    Color(0XFFFFCF2F),
    Color(0XFF6FE08D),
    Color(0XFF61BDFD),
    Color(0XFFFC7F7F),
    Color(0XFFCB84FB),
    Color(0XFF78E667),
  ];

  List<Icon> catIcons = [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];
  List imgList = [
    'Flutter'
  ];
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Color(0xFFD0E2E5),
       body: ListView(
         children: [
           Container(
             padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
             decoration: BoxDecoration(
               color: Color(0xFF0098DA),
               borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(20),
                 bottomRight: Radius.circular(20),
               ),
             ),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Icon(
                       Icons.dashboard,
                       size: 30,
                       color: Colors.white,
                     ),
                     Icon(
                       Icons.notifications,
                       size: 30,
                       color: Colors.white,
                     ),
                   ],
                 ),
                 SizedBox(height: 20),
                 Padding(
                   padding: EdgeInsets.only(left: 3, bottom: 15),
                   child: Text("JAGAD BUKU", style: TextStyle(
                     fontSize: 25, fontWeight: FontWeight.w600,
                     letterSpacing : 1,
                     wordSpacing: 2,
                     color: Colors.white,
                   ),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 5, bottom: 20),
                   width: MediaQuery.of(context).size.width,
                   height: 55,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: TextFormField(
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: "Cari Buku",
                       hintStyle: TextStyle(
                         color: Colors.black.withOpacity(0.5),
                       ),
                       prefixIcon: Icon(Icons.search,size: 25,),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding: EdgeInsets.only(top: 20, left: 15, right: 15),
             child: Column(children: [
               GridView.builder(
                   itemCount: catNames.length,
                   shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                     childAspectRatio: 1.1,
                   ),
                   itemBuilder: (context, index){
                     return Column(
                       children: [
                         Container(
                           height: 60,
                           width: 60,
                           decoration: BoxDecoration(
                             color: catColors[index],
                             shape: BoxShape.circle,
                           ),
                           child: Center(
                             child: catIcons[index],
                           ),
                         ),
                         SizedBox(height: 10),
                         Text(
                           catNames[index],
                           style: TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.w500,
                             color: Colors.black.withOpacity(0.7),
                           ),
                         ),
                       ],
                     );
                   }
               ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Courses",
                     style: TextStyle(
                       fontSize: 23,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   Text(
                     "See All",
                     style: TextStyle(
                       fontSize: 23,
                       fontWeight: FontWeight.w500,
                       color: Color(0xFF674AEF),
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 10),
               // GridView.builder(
               //   shrinkWrap: true,
               //     physics: NeverScrollableScrollPhysics(),
               //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               //       crossAxisCount: 2,
               //       childAspectRatio : (MediaQuery.of(context).size.height - 50 - 25) /  (4 * 240),
               //       mainAxisSpacing: 10,
               //       crossAxisSpacing: 10,
               //     ),
               // ),
             ],),
           ),
         ],
       ),
     );
   }


}