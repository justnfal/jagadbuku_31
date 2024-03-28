import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../data/model/response_buku.dart';
import '../../../routes/app_pages.dart';
import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
   DetailBukuView({Key? key}) : super(key: key);

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
            fontWeight: FontWeight.bold, // Mengatur teks menjadi tebal
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('lib/app/assets/logo/logo4.2.png'),
                                // Atur agar gambar mengisi container
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: controller.obx(
                                  (state) => ListView.separated(
                                itemCount: state!.length,
                                itemBuilder: (context, index) {
                                  DataBuku dataBuku = state[index];
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
                                      child: InkWell(
                                        onTap: () => Get.toNamed(
                                          Routes.DETAIL_BUKU,
                                          parameters: {
                                            'id': (dataBuku.id ?? 0).toString(),
                                            'judul': dataBuku.judul ?? '-',
                                            'penulis': dataBuku.penulis ?? '-',
                                            'penerbit': dataBuku.penerbit ?? '-',
                                            'tahun_terbit': dataBuku.tahunTerbit.toString() ?? '-',
                                            'deskripsi': dataBuku.deskripsi ?? '-',
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox.shrink(),
                              ),
                              onLoading: Center(child: CupertinoActivityIndicator()),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 12),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           color: Colors.grey.shade200,
                    //           borderRadius: BorderRadius.circular(20),
                    //           boxShadow: const [
                    //             BoxShadow(
                    //               color: Colors.grey,
                    //               offset: Offset(2, 2),
                    //               blurRadius: 5,
                    //             ),
                    //           ],
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Column(
                    //             children: [
                    //               Icon(
                    //                 CupertinoIcons.airplane,
                    //                 color: Colors.redAccent,
                    //               ),
                    //               Text(
                    //                 '467 Clories',
                    //                 style: TextStyle(
                    //                   fontSize: 10,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                  ],
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
                  Get.toNamed(Routes.DETAIL_BUKU);
                  break;
                case 2:
                  Get.toNamed(Routes.DETAIL_BUKU);
                  break;
                default:
                  break;
              }
            },
            selectedItemColor: Colors.black, // Mengubah warna label yang terpilih menjadi putih
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
      ),
    );
  }
}