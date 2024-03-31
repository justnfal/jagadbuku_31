import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pinjam_buku_controller.dart';

class PinjamBukuView extends GetView<PinjamBukuController> {
  const PinjamBukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PinjamBukuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PinjamBukuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
