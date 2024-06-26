import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jagadbuku_31/app/data/model/response_koleksi.dart';

import '../../../routes/app_pages.dart';
import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
   KoleksiView({Key? key}) : super(key: key);

  final _bottomNavIndex = 0.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E2E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFD0E2E5),
        title: Text(
          'Lihat Koleksi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [

          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1.0,
              child: controller.obx((state) => ListView.separated(
                itemCount: state!.length,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                itemBuilder: (context, index){
                  DataKoleksi dataBook = state[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0), // Tambahkan jarak vertikal
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child:  ListTile(
                        title: Text("${dataBook.book?.judul}"),
                        subtitle: Text("Penulis ${dataBook.book?.penulis}\nPenerbit ${dataBook.book?.penerbit}\nTahun Terbit ${dataBook.book?.tahunTerbit}"),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox.shrink(),
              )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

   Widget buildBottomNavigationBar() {
     return Obx(
           () => Container(
         child: BottomNavigationBar(
           backgroundColor: Colors.blue,
           currentIndex: _bottomNavIndex.value,
           onTap: (value) {
             _bottomNavIndex.value = value;
             switch (value) {
               case 0:
                 Get.toNamed(Routes.HOME);
                 break;
               case 1:
                 Get.toNamed(Routes.KOLEKSI);
                 break;
               case 2:
                 Get.toNamed(Routes.PEMINJAMAN);
                 break;
               default:
                 break;
             }
           },
           selectedItemColor: Colors.black,
           unselectedItemColor: Colors.black,
           items: [
             BottomNavigationBarItem(
               icon: Icon(
                 Icons.home,
                 color: Colors.black,
               ),
               label: 'Home',
             ),
             BottomNavigationBarItem(
               icon: Icon(
                 Icons.book,
                 color: Colors.black,
               ),
               label: 'Collection',
             ),
             BottomNavigationBarItem(
               icon: Icon(
                 Icons.menu_book,
                 color: Colors.black,
               ),
               label: 'Lihat Peminjaman',
             ),
           ],
         ),
       ),
     );
   }
}
