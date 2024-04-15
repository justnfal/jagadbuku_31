import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:jagadbuku_31/app/data/model/response_buku.dart';
import 'package:jagadbuku_31/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        child: ListView(
          children: [
            Container(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: '${Get.parameters['image']}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${Get.parameters['judul']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Form(
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
                              SizedBox(height: 20),
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
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  controller.pinjam();
                                  Get.offNamed(Routes.HOME);
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue, // Atur warna teks pada tombol
                                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 85), // Atur padding tombol
                                  textStyle: TextStyle(fontSize: 18), // Atur ukuran teks tombol
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Atur bentuk tombol
                                ),
                                child: Text("Pinjam"), // Teks pada tombol
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
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
            // Mengubah warna label yang terpilih menjadi putih
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
      ),
    );
  }
}
