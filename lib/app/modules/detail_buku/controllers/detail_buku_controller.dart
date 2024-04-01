import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jagadbuku_31/app/data/model/response_buku.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class DetailBukuController extends GetxController with StateMixin<List<DataBuku>> {
  //TODO: Implement DetailBukuController

  final count = 0.obs;


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

  goToPinjamBuku() {
    Get.toNamed(Routes.PINJAM_BUKU);
  }
}