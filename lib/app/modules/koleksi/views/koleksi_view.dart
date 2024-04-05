import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jagadbuku_31/app/data/model/response_koleksi.dart';

import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E2E5),
      appBar: AppBar(
        backgroundColor: Color(0xFFD0E2E5),
        title: Text(
          'Lihat Peminjaman',
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
              height: MediaQuery.of(context).size.height * 0.5,
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
                        subtitle: Text("Penulis ${dataBook.}\nDipinjam tanggal ${dataBook.tanggalPinjam}\nDikembalikan tanggal ${dataBook.tanggalKembali}\nStatus ${dataBook.status} "),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index)=> Divider(),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
