import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jagadbuku_31/app/data/model/response_pinjam.dart';

import '../../../data/model/response_pinjam.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
      body: controller.obx((state) => ListView.separated(
        itemCount: state!.length,
        itemBuilder: (context, index){
          DataPeminjaman dataBook = state[index];
          return ListTile(
            title: Text("${dataBook.book?.judul}"),
            subtitle: Text("Peminjam ${dataBook.userId}\nDipinjam tanggal ${dataBook.tanggalPinjam}\nDikembalikan tanggal ${dataBook.tanggalKembali}\nStatus ${dataBook.status} "),
          );
        },
        separatorBuilder: (context, index)=> Divider(),
      )),
    );
  }
}
