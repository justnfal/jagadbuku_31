import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';

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
                // TextFormField(
                //   controller: controller.tglpinjamController,
                //   decoration: InputDecoration(hintText: "tanggal peminjaman"),
                //   validator: (value) {
                //     if (value!.length < 2) {
                //       return "tanggal peminjaman tidak boleh kosong";
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   controller: controller.tglkembaliController,
                //   decoration: InputDecoration(hintText: "tanggal pengembalian"),
                //   validator: (value) {
                //     if (value!.length < 2) {
                //       return "tanggal pengembalian tidak boleh kosong";
                //     }
                //     return null;
                //   },
                // ),
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
