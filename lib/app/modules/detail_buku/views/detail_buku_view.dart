import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jagadbuku_31/app/data/model/response_buku.dart';
import 'package:jagadbuku_31/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import package untuk CachedNetworkImage

import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  final _bottomNavIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E2E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFD0E2E5),
        title: Text(
          'Detail Buku',
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
        buildBookInfo(),
      ],
    );
  }

  Widget buildBookInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
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
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: controller.obx(
                        (state) {
                      if (state == null || state.isEmpty) {
                        // Tampilkan CircularProgressIndicator saat sedang memuat
                        return CircularProgressIndicator();
                      }
                      final DataBuku dataBuku = state[0];
                      // Gunakan CachedNetworkImage
                      final imageUrl = dataBuku.image;
                      return CachedNetworkImage(
                        imageUrl: imageUrl ?? '',
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      );
                    },
                  ),
                ),
                SizedBox(width: 16), // Jarak antara gambar dan teks
                Expanded(
                  flex: 5,
                  child: controller.obx(
                        (state) {
                      if (state == null || state.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final DataBuku dataBuku = state[0];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Judul: ${dataBuku.judul!}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Penulis: ${dataBuku.penulis!}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Penerbit: ${dataBuku.penerbit!}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Tahun Terbit: ${dataBuku.tahunTerbit}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: controller.goToPinjamBuku,
                            child: Text('Pinjam Buku'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(), // Box yang kosong sebagai pembatas
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20), // Jarak antara box-box
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi Buku:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                controller.obx(
                      (state) {
                    if (state == null || state.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final DataBuku dataBuku = state[0];
                    return Text(
                      dataBuku.deskripsi!,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
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
