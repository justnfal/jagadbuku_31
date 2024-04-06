/// status : 200
/// message : "success"
/// data : [{"id":4,"user_id":9,"book_id":20,"created_at":"2024-04-06T12:47:50.000000Z","updated_at":"2024-04-06T12:47:50.000000Z","book":{"id":20,"judul":"Red-Handed: How American Elites Get Rich Helping China Win","penulis":"Peter Schweizer","penerbit":"Harper Collins Us","image":"http://192.168.42.86:8000/images/red-handed.PNG","tahun_terbit":2022,"deskripsi":"Upaya pemerintah Tiongkok untuk menyusup ke dalam lembaga-lembaga Amerika bukanlah hal yang mengejutkan. Namun, yang benar-benar baru adalah jumlah elit Amerika yang sangat ingin membantu kediktatoran Tiongkok dalam upayanya untuk meraih hegemoni global. \nPresiden keluarga, para guru Silicon Valley, para petinggi Wall Street, universitas-universitas Ivy League, bahkan para atlet profesional - semuanya bersedia mengorbankan kekuatan dan keamanan Amerika demi memperkaya diri sendiri. ","kategori_id":1,"kategori":{"id":1,"nama":"umum"}}}]

class ResponseKoleksi {
  ResponseKoleksi({
    int? status,
    String? message,
    List<DataKoleksi>? data,
  }){
    _status = status;
    _message = message;
    _data = data;
  }

  ResponseKoleksi.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(DataKoleksi.fromJson(v));
      });
    }
  }

  int? _status;
  String? _message;
  List<DataKoleksi>? _data;

  int? get status => _status;
  String? get message => _message;
  List<DataKoleksi>? get data => _data;

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

class DataKoleksi {
  DataKoleksi({
    int? id,
    int? userId,
    int? bookId,
    String? createdAt,
    String? updatedAt,
    Book? book,
  }){
    _id = id;
    _userId = userId;
    _bookId = bookId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _book = book;
  }

  DataKoleksi.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _bookId = json['book_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }

  int? _id;
  int? _userId;
  int? _bookId;
  String? _createdAt;
  String? _updatedAt;
  Book? _book;

  int? get id => _id;
  int? get userId => _userId;
  int? get bookId => _bookId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Book? get book => _book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['book_id'] = _bookId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_book != null) {
      map['book'] = _book!.toJson();
    }
    return map;
  }
}

class Book {
  Book({
    int? id,
    String? judul,
    String? penulis,
    String? penerbit,
    String? image,
    int? tahunTerbit,
    String? deskripsi,
    int? kategoriId,
    Kategori? kategori,
  }){
    _id = id;
    _judul = judul;
    _penulis = penulis;
    _penerbit = penerbit;
    _image = image;
    _tahunTerbit = tahunTerbit;
    _deskripsi = deskripsi;
    _kategoriId = kategoriId;
    _kategori = kategori;
  }

  Book.fromJson(dynamic json) {
    _id = json['id'];
    _judul = json['judul'];
    _penulis = json['penulis'];
    _penerbit = json['penerbit'];
    _image = json['image'];
    _tahunTerbit = json['tahun_terbit'];
    _deskripsi = json['deskripsi'];
    _kategoriId = json['kategori_id'];
    _kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  int? _id;
  String? _judul;
  String? _penulis;
  String? _penerbit;
  String? _image;
  int? _tahunTerbit;
  String? _deskripsi;
  int? _kategoriId;
  Kategori? _kategori;

  int? get id => _id;
  String? get judul => _judul;
  String? get penulis => _penulis;
  String? get penerbit => _penerbit;
  String? get image => _image;
  int? get tahunTerbit => _tahunTerbit;
  String? get deskripsi => _deskripsi;
  int? get kategoriId => _kategoriId;
  Kategori? get kategori => _kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['judul'] = _judul;
    map['penulis'] = _penulis;
    map['penerbit'] = _penerbit;
    map['image'] = _image;
    map['tahun_terbit'] = _tahunTerbit;
    map['deskripsi'] = _deskripsi;
    map['kategori_id'] = _kategoriId;
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
  }){
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
