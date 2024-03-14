class ResponseBuku {
  ResponseBuku({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResponseBuku.fromJson(dynamic json) {
    return ResponseBuku(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? List<DataBuku>.from(json['data'].map((x) => DataBuku.fromJson(x))) : [],
    );
  }

  final int status;
  final String message;
  final List<DataBuku> data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
    return map;
  }
}

class DataBuku {
  DataBuku({
    required this.id,
    required this.kategoriId,
    required this.judul,
    required this.penulis,
    required this.penerbit,
    required this.tahunTerbit,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
    required this.kategori,
  });

  factory DataBuku.fromJson(dynamic json) {
    return DataBuku(
      id: json['id'],
      kategoriId: json['kategori_id'],
      judul: json['judul'],
      penulis: json['penulis'],
      penerbit: json['penerbit'],
      tahunTerbit: json['tahun_terbit'],
      deskripsi: json['deskripsi'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      kategori: json['kategori'] != null ? Kategori.fromJson(json['kategori']) : Kategori(id: 0, nama: ''),
    );
  }

  final int id;
  final int kategoriId;
  final String judul;
  final String penulis;
  final String penerbit;
  final int tahunTerbit;
  final String deskripsi;
  final String createdAt;
  final String updatedAt;
  final Kategori kategori;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'id': id,
      'kategori_id': kategoriId,
      'judul': judul,
      'penulis': penulis,
      'penerbit': penerbit,
      'tahun_terbit': tahunTerbit,
      'deskripsi': deskripsi,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'kategori': kategori.toJson(),
    };
    return map;
  }
}

class Kategori {
  Kategori({
    required this.id,
    required this.nama,
  });

  factory Kategori.fromJson(dynamic json) {
    return Kategori(
      id: json['id'],
      nama: json['nama'],
    );
  }

  final int id;
  final String nama;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'id': id,
      'nama': nama,
    };
    return map;
  }
}
