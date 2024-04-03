import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:jagadbuku_31/app/data/model/response_pinjam.dart';
import 'package:jagadbuku_31/app/data/model/response_buku.dart';
import 'package:jagadbuku_31/app/data/constant/endpoint.dart';
import 'package:jagadbuku_31/app/data/provider/api_provider.dart';
import 'package:jagadbuku_31/app/data/provider/storage_provider.dart';
import 'package:jagadbuku_31/app/modules/detail_buku/controllers/detail_buku_controller.dart';
import 'package:jagadbuku_31/app/routes/app_pages.dart';

import '../../../data/model/response_buku.dart';
class AddPeminjamanController extends GetxController with StateMixin<List<DataBuku>>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tglpinjamController = TextEditingController();
  final TextEditingController tglkembaliController = TextEditingController();
  final TextEditingController userID = TextEditingController();
  final TextEditingController bookID = TextEditingController();
  final loading = false.obs;



  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  pinjam() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data: ({
              "tanggal_pinjam": tglpinjamController.text.toString(),
              "tanggal_kembali": tglkembaliController.text.toString(),
              "user_id": int.parse(StorageProvider.read(StorageKey.idUser)),
              "book_id": int.parse(Get.parameters['id'].toString()),
              // "book_id": int.parse(${Get.parameters['']}),
            }));
        if (response.statusCode == 201) {
          Get.back();
        } else {
          Get.snackbar("Sorry", "Gagal Menambahkan Buku", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.buku);
      if (response.statusCode == 200) {
        final ResponseBuku responseBuku = ResponseBuku.fromJson(response.data);
        if (responseBuku.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBuku.data as List<DataBuku>?, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Mngambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
