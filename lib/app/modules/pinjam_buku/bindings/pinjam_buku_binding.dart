import 'package:get/get.dart';

import '../controllers/pinjam_buku_controller.dart';

class PinjamBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinjamBukuController>(
      () => PinjamBukuController(),
    );
  }
}
