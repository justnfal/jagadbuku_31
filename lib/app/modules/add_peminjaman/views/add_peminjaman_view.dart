import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../data/model/response_buku.dart';
import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul']}'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Column(
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
                                  return CachedNetworkImage(
                                    imageUrl: dataBuku.image ?? '',
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                DateTimePicker(
                  controller: controller.tglpinjamController,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date',
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
                    },
                    child: Text("Pinjam"))),
                // ElevatedButton(onPressed: (){controller.login();}, child: Text("Login"))
              ],
            ),
          )),
    );
  }
}
