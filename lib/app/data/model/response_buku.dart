/// status : 200
/// message : "success"
/// data : [{"id":14,"kategori_id":2,"judul":"Akasha : Neon Genesis Evangelion - Collector's Edition 02","penulis":"Yoshiyuki Sadamoto","penerbit":"m&c!","image":"post_images/1711979581.PNG","tahun_terbit":2023,"deskripsi":"Shinji penasaran dengan pilot Unit-00 yang misterius, Rei, termasuk hubungan dengan ayahnya. Di tengah percobaan aktivasi ulang Unit-00, datang Angel ke-5 yang memiliki sistem penyerangan dan pertahanan sempurna!\n\nDi antara jenis buku lainnya, komik memang disukai oleh semua kalangan mulai dari anak kecil hingga orang dewasa. Alasan komik lebih disukai oleh banyak orang karena disajikan dengan penuh dengan gambar dan cerita yang mengasyikan sehingga mampu menghilangkan rasa bosan di kala waktu senggang.","created_at":"2024-04-01T13:53:02.000000Z","updated_at":"2024-04-01T13:53:02.000000Z","kategori":{"id":2,"nama":"hiburan"}}]

class ResponseBuku {
  ResponseBuku({
    int? status,
    String? message,
    List<DataBuku>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  ResponseBuku.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(DataBuku.fromJson(v));
      });
    }
  }

  int? _status;
  String? _message;
  List<DataBuku>? _data;

  int? get status => _status;
  String? get message => _message;
  List<DataBuku>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataBuku {
  DataBuku({
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
  }) {
    _id = id;
    _kategoriId = kategoriId;
    _judul = judul;
    _penulis = penulis;
    _penerbit = penerbit;
    _image = image;
    _tahunTerbit = tahunTerbit;
    _deskripsi = deskripsi;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _kategori = kategori;
  }

  DataBuku.fromJson(dynamic json) {
    _id = json['id'];
    _kategoriId = json['kategori_id'];
    _judul = json['judul'];
    _penulis = json['penulis'];
    _penerbit = json['penerbit'];
    _image = json['image'];
    _tahunTerbit = json['tahun_terbit'];
    _deskripsi = json['deskripsi'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  int? _id;
  int? _kategoriId;
  String? _judul;
  String? _penulis;
  String? _penerbit;
  String? _image;
  int? _tahunTerbit;
  String? _deskripsi;
  String? _createdAt;
  String? _updatedAt;
  Kategori? _kategori;

  int? get id => _id;
  int? get kategoriId => _kategoriId;
  String? get judul => _judul;
  String? get penulis => _penulis;
  String? get penerbit => _penerbit;
  String? get image => _image;
  int? get tahunTerbit => _tahunTerbit;
  String? get deskripsi => _deskripsi;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Kategori? get kategori => _kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['kategori_id'] = _kategoriId;
    map['judul'] = _judul;
    map['penulis'] = _penulis;
    map['penerbit'] = _penerbit;
    map['image'] = _image;
    map['tahun_terbit'] = _tahunTerbit;
    map['deskripsi'] = _deskripsi;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_kategori != null) {
      map['kategori'] = _kategori!.toJson();
    }
    return map;
  }
}

class Kategori {
  Kategori({
    int? id,
    String? nama,
  }) {
    _id = id;
    _nama = nama;
  }

  Kategori.fromJson(dynamic json) {
    _id = json['id'];
    _nama = json['nama'];
  }

  int? _id;
  String? _nama;

  int? get id => _id;
  String? get nama => _nama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    return map;
  }
}