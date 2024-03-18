/// status : 200
/// message : "success"
/// data : [{"id":1,"kategori_id":1,"judul":"Belajar Ngoding","penulis":"Naufal","penerbit":"Gustav Industries","tahun_terbit":2024,"deskripsi":"Buku untuk belajar ngoding","created_at":"2024-03-07T00:34:47.000000Z","updated_at":"2024-03-07T00:34:47.000000Z","kategori":{"id":1,"nama":"umum"}}]

class ResponseBuku {
  ResponseBuku({
    this.status,
    this.message,
    this.data,
  });

  num? status;
  String? message;
  List<DataBuku>? data;

  ResponseBuku.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataBuku>[];
      json['data'].forEach((v) {
        data!.add(DataBuku.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataBuku {
  DataBuku({
    this.id,
    this.kategoriId,
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
    this.kategori,
  });

  num? id;
  num? kategoriId;
  String? judul;
  String? penulis;
  String? penerbit;
  num? tahunTerbit;
  String? deskripsi;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  DataBuku.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kategori_id'] = kategoriId;
    data['judul'] = judul;
    data['penulis'] = penulis;
    data['penerbit'] = penerbit;
    data['tahun_terbit'] = tahunTerbit;
    data['deskripsi'] = deskripsi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (kategori != null) {
      data['kategori'] = kategori!.toJson();
    }
    return data;
  }
}

class Kategori {
  Kategori({
    this.id,
    this.nama,
  });

  num? id;
  String? nama;

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}