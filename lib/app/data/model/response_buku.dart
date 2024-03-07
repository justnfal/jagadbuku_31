/// status : 200
/// message : "success"
/// data : [{"id":1,"kategori_id":1,"judul":"Naufal Suka Ngoding","penulis":"Naufal","penerbit":"Naufal Company","tahun_terbit":2024,"created_at":"2024-03-07T00:34:47.000000Z","updated_at":"2024-03-07T00:34:47.000000Z","kategori":{"id":1,"nama":"umum"}}]

class ResponseBuku {
  ResponseBuku({
      num status, 
      String message, 
      List<Data> data,}){
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
        _data.add(Data.fromJson(v));
      });
    }
  }
  num _status;
  String _message;
  List<Data> _data;
ResponseBuku copyWith({  num status,
  String message,
  List<Data> data,
}) => ResponseBuku(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num get status => _status;
  String get message => _message;
  List<Data> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// kategori_id : 1
/// judul : "Naufal Suka Ngoding"
/// penulis : "Naufal"
/// penerbit : "Naufal Company"
/// tahun_terbit : 2024
/// created_at : "2024-03-07T00:34:47.000000Z"
/// updated_at : "2024-03-07T00:34:47.000000Z"
/// kategori : {"id":1,"nama":"umum"}

class Data {
  Data({
      num id, 
      num kategoriId, 
      String judul, 
      String penulis, 
      String penerbit, 
      num tahunTerbit, 
      String createdAt, 
      String updatedAt, 
      Kategori kategori,}){
    _id = id;
    _kategoriId = kategoriId;
    _judul = judul;
    _penulis = penulis;
    _penerbit = penerbit;
    _tahunTerbit = tahunTerbit;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _kategori = kategori;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _kategoriId = json['kategori_id'];
    _judul = json['judul'];
    _penulis = json['penulis'];
    _penerbit = json['penerbit'];
    _tahunTerbit = json['tahun_terbit'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }
  num _id;
  num _kategoriId;
  String _judul;
  String _penulis;
  String _penerbit;
  num _tahunTerbit;
  String _createdAt;
  String _updatedAt;
  Kategori _kategori;
Data copyWith({  num id,
  num kategoriId,
  String judul,
  String penulis,
  String penerbit,
  num tahunTerbit,
  String createdAt,
  String updatedAt,
  Kategori kategori,
}) => Data(  id: id ?? _id,
  kategoriId: kategoriId ?? _kategoriId,
  judul: judul ?? _judul,
  penulis: penulis ?? _penulis,
  penerbit: penerbit ?? _penerbit,
  tahunTerbit: tahunTerbit ?? _tahunTerbit,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  kategori: kategori ?? _kategori,
);
  num get id => _id;
  num get kategoriId => _kategoriId;
  String get judul => _judul;
  String get penulis => _penulis;
  String get penerbit => _penerbit;
  num get tahunTerbit => _tahunTerbit;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  Kategori get kategori => _kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['kategori_id'] = _kategoriId;
    map['judul'] = _judul;
    map['penulis'] = _penulis;
    map['penerbit'] = _penerbit;
    map['tahun_terbit'] = _tahunTerbit;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_kategori != null) {
      map['kategori'] = _kategori.toJson();
    }
    return map;
  }

}

/// id : 1
/// nama : "umum"

class Kategori {
  Kategori({
      num id, 
      String nama,}){
    _id = id;
    _nama = nama;
}

  Kategori.fromJson(dynamic json) {
    _id = json['id'];
    _nama = json['nama'];
  }
  num _id;
  String _nama;
Kategori copyWith({  num id,
  String nama,
}) => Kategori(  id: id ?? _id,
  nama: nama ?? _nama,
);
  num get id => _id;
  String get nama => _nama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    return map;
  }

}