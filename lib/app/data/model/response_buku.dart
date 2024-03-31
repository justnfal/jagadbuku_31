/// status : 200
/// message : "success"
/// data : [{"id":10,"kategori_id":2,"judul":"Akasha : Neon Genesis Evangelion - Collector's Edition 02","penulis":"Yoshiyuki Sadamoto","penerbit":"m&c!","image":"C:\\xampp\\tmp\\phpB5FB.tmp","tahun_terbit":2023,"deskripsi":"Shinji penasaran dengan pilot Unit-00 yang misterius, Rei, termasuk hubungan dengan ayahnya. Di tengah percobaan aktivasi ulang Unit-00, datang Angel ke-5 yang memiliki sistem penyerangan dan pertahanan sempurna!\n\nDi antara jenis buku lainnya, komik memang disukai oleh semua kalangan mulai dari anak kecil hingga orang dewasa. Alasan komik lebih disukai oleh banyak orang karena disajikan dengan penuh dengan gambar dan cerita yang mengasyikan sehingga mampu menghilangkan rasa bosan di kala waktu senggang.","created_at":"2024-03-30T11:44:11.000000Z","updated_at":"2024-03-30T11:44:11.000000Z","kategori":{"id":2,"nama":"hiburan"}}]

class ResponseBuku {
  ResponseBuku({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<DataBuku>? data;

  ResponseBuku.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataBuku>[];
      json['data'].forEach((v) {
        data?.add(DataBuku.fromJson(v));
      });
    }
  }

  ResponseBuku copyWith({
    int? status,
    String? message,
    List<DataBuku>? data,
  }) =>
      ResponseBuku(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );
}

class DataBuku {
  DataBuku({
    this.id,
    this.kategoriId,
    this.judul,
    this.penulis,
    this.penerbit,
    this.image,
    this.tahunTerbit,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
    this.kategori,
  });

  int? id;
  int? kategoriId;
  String? judul;
  String? penulis;
  String? penerbit;
  String? image;
  int? tahunTerbit;
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
    image = json['image'];
    tahunTerbit = json['tahun_terbit'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  DataBuku copyWith({
    int? id,
    int? kategoriId,
    String? judul,
    String? penulis,
    String? penerbit,
    String? image,
    int? tahunTerbit,
    String? deskripsi,
    String? createdAt,
    String? updatedAt,
    Kategori? kategori,
  }) =>
      DataBuku(
        id: id ?? this.id,
        kategoriId: kategoriId ?? this.kategoriId,
        judul: judul ?? this.judul,
        penulis: penulis ?? this.penulis,
        penerbit: penerbit ?? this.penerbit,
        image: image ?? this.image,
        tahunTerbit: tahunTerbit ?? this.tahunTerbit,
        deskripsi: deskripsi ?? this.deskripsi,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        kategori: kategori ?? this.kategori,
      );
}

class Kategori {
  Kategori({
    this.id,
    this.nama,
  });

  int? id;
  String? nama;

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Kategori copyWith({
    int? id,
    String? nama,
  }) =>
      Kategori(
        id: id ?? this.id,
        nama: nama ?? this.nama,
      );
}