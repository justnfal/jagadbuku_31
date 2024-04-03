import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';
import 'package:jagadbuku_31/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../data/model/response_buku.dart';
import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
   AddPeminjamanView({Key? key}) : super(key: key);

  final _bottomNavIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E2E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFD0E2E5),
        title: Text(
          'Pinjam Buku',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: buildContent(),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildContent() {
    return ListView(
      children: [
        buildImageInfo(),
        buildPinjamBuku(),
      ],
    );
  }
   Widget buildImageInfo() {
     return Container(
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(15),
         boxShadow: [
           BoxShadow(
             color: Colors.grey,
             offset: Offset(3, 3),
             blurRadius: 5,
           ),
         ],
       ),
       child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: controller.obx(
               (state) {
             if (state == null || state.isEmpty) {
               return Center(
                 child: CircularProgressIndicator(),
               );
             }
             final DataBuku dataBuku = state[0];
             return Column(
               crossAxisAlignment: CrossAxisAlignment.center, // Ubah crossAxisAlignment menjadi center
               mainAxisAlignment: MainAxisAlignment.center, // Tambahkan mainAxisAlignment
               children: [
                 Container(
                   width: 150, // Atur lebar gambar sesuai kebutuhan
                   height: 200, // Atur tinggi gambar sesuai kebutuhan
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: CachedNetworkImage(
                     imageUrl: dataBuku.image ?? '',
                     fit: BoxFit.cover, // Atur ukuran gambar sesuai container
                     placeholder: (context, url) => CircularProgressIndicator(),
                     errorWidget: (context, url, error) => Icon(Icons.error),
                   ),
                 ),
                 SizedBox(height: 8), // Jarak antara gambar dan teks
                 Text(
                   '${dataBuku.judul!}',
                   style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                   textAlign: TextAlign.center, // Menempatkan teks di tengah secara horizontal
                 ),
               ],
             );
           },
         ),
       ),
     );
   }

   Widget buildPinjamBuku() {
     return Container(
       child: Center(
         child: Form(
           key: controller.formKey,
           child: Column(
             children: [
               DateTimePicker(
                 controller: controller.tglpinjamController,
                 firstDate: DateTime(2000),
                 lastDate: DateTime(2100),
                 dateLabelText: 'Tanggal Peminjaman',
                 onChanged: (val) => print(val),
                 validator: (value) {
                   if (value!.length < 2) {
                     return "tanggal peminjaman tidak boleh kosong";
                   }
                   return null;
                 },
                 onSaved: (val) => print(val),
               ),
               DateTimePicker(
                 controller: controller.tglkembaliController,
                 firstDate: DateTime(2000),
                 lastDate: DateTime(2100),
                 dateLabelText: 'Tanggal Pengembalian',
                 onChanged: (val) => print(val),
                 validator: (value) {
                   if (value!.length < 2) {
                     return "tanggal pengembalian tidak boleh kosong";
                   }
                   return null;
                 },
                 onSaved: (val) => print(val),
               ),
               Obx(() => controller.loading.value
                   ? CircularProgressIndicator()
                   : ElevatedButton(
                 onPressed: () {
                   controller.pinjam();
                   Get.offNamed(Routes.HOME); // Navigasi ke halaman Home_page
                 },
                 child: Text("Pinjam"),
               )),
             ],
           ),
         ),
       ),
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
                Get.toNamed(Routes.DETAIL_BUKU);
                break;
              case 2:
                Get.toNamed(Routes.DETAIL_BUKU);
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
                Icons.person,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
