import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jagadbuku_31/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  final _bottomNavIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    // Ambil parameter yang dikirim dari HomeView
    final Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;

    if (args == null) {
      // Handle jika args adalah null
      return Scaffold(
        body: Center(
          child: Text('Data buku tidak ditemukan'),
        ),
      );
    }

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
        child: buildContent(args), // Mengirim parameter ke buildContent
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildContent(Map<String, dynamic> args) {
    return ListView(
      children: [
        buildBookInfo(args), // Menggunakan parameter untuk menampilkan detail buku
      ],
    );
  }

  Widget buildBookInfo(Map<String, dynamic> args) {
    final id = args['id'];
    final judul = args['judul'];
    final penulis = args['penulis'];
    final penerbit = args['penerbit'];
    final tahunTerbit = args['tahun_terbit'];
    final deskripsi = args['deskripsi'];

    // Tampilkan detail buku menggunakan data dari parameter
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
                  child: Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: '', // Isi dengan URL gambar buku
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Judul: $judul',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Penulis: $penulis',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Penerbit: $penerbit',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Tahun Terbit: $tahunTerbit',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {'id': id, 'judul': judul});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00DA16),
                          foregroundColor: Colors.white,
                          minimumSize: Size(121, 36),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Pinjam Buku"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
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
                Text(
                  deskripsi,
                  style: TextStyle(
                    fontSize: 14,
                  ),
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
