import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jagadbuku_31/app/data/model/response_buku.dart';
import 'package:jagadbuku_31/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../controllers/search_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final searchController = Get.put(HomeController());

  final _bottomNavIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E2E5),
      body: Obx(
            () {
          final searchQuery = searchController.searchText.value.toLowerCase();
          final filteredBooks = controller.state?.where((book) =>
          book.judul!.toLowerCase().contains(searchQuery) ||
              book.penulis!.toLowerCase().contains(searchQuery) ||
              book.penerbit!.toLowerCase().contains(searchQuery)
          ).toList();
          return ListView(
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
                          Icons.person,
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
                      child: Text(
                        "JAGAD BUKU",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
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
                        onChanged: (value) => searchController.setSearchText(value),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cari Buku',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: controller.obx(
                        (state) => ListView.separated(
                      itemCount: filteredBooks?.length ?? 0,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                      itemBuilder: (context, index) {
                        DataBuku dataBuku = filteredBooks![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
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
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_BUKU, arguments: {
                                    'id': (dataBuku.id ?? 0).toString(),
                                    'judul': dataBuku.judul ?? '-',
                                    'penulis': dataBuku.penulis ?? '-',
                                    'penerbit': dataBuku.penerbit ?? '-',
                                    'image': dataBuku.image ?? '-',
                                    'tahun_terbit': dataBuku.tahunTerbit.toString() ?? '-',
                                    'deskripsi': dataBuku.deskripsi ?? '-',
                                    'kategoriId': dataBuku.kategoriId ?? '-',
                                    'kategoriNama': dataBuku.kategori?.nama ?? '-'
                                  });
                              },
                              child: ListTile(
                                title: Text("${dataBuku.judul}"),
                                subtitle: Text(
                                  "Penulis ${dataBuku.penulis}\n${dataBuku.penerbit} - ${dataBuku.tahunTerbit}",
                                ),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox.shrink(),
                    ),
                    onLoading: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ],
          );
        },
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
