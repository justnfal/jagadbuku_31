/// status : 200
/// message : "success"
/// data : [{"id":1,"kategori_id":1,"judul":"Naufal Suka Ngoding","penulis":"Naufal","penerbit":"Naufal Company","tahun_terbit":2024,"created_at":"2024-03-07T00:34:47.000000Z","updated_at":"2024-03-07T00:34:47.000000Z","kategori":{"id":1,"nama":"umum"}}]

class ResponseBuku {
  ResponseBuku({
    required int status,
    required String message,
    required List<Data> data,
  })   : _status = status,
        _message = message,
        _data = data;

  ResponseBuku.fromJson(Map<String, dynamic> json)
      : _status = json['status'] ?? 0,
        _message = json['message'] ?? '',
        _data = (json['data'] as List<dynamic>?)
            ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
            .toList() ?? [];

  final int _status;
  final String _message;
  final List<Data> _data;

  int get status => _status;
  String get message => _message;
  List<Data> get data => _data;
}

class Data {
  Data({
    required int id,
    required int kategoriId,
    required String judul,
    required String penulis,
    required String penerbit,
    required int tahunTerbit,
    required String createdAt,
    required String updatedAt,
    required Kategori kategori,
  })   : _id = id,
        _kategoriId = kategoriId,
        _judul = judul,
        _penulis = penulis,
        _penerbit = penerbit,
        _tahunTerbit = tahunTerbit,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _kategori = kategori;

  Data.fromJson(Map<String, dynamic> json)
      : _id = json['id'] ?? 0,
        _kategoriId = json['kategori_id'] ?? 0,
        _judul = json['judul'] ?? '',
        _penulis = json['penulis'] ?? '',
        _penerbit = json['penerbit'] ?? '',
        _tahunTerbit = json['tahun_terbit'] ?? 0,
        _createdAt = json['created_at'] ?? '',
        _updatedAt = json['updated_at'] ?? '',
        _kategori = Kategori.fromJson(json['kategori'] ?? {});

  final int _id;
  final int _kategoriId;
  final String _judul;
  final String _penulis;
  final String _penerbit;
  final int _tahunTerbit;
  final String _createdAt;
  final String _updatedAt;
  final Kategori _kategori;

  int get id => _id;
  int get kategoriId => _kategoriId;
  String get judul => _judul;
  String get penulis => _penulis;
  String get penerbit => _penerbit;
  int get tahunTerbit => _tahunTerbit;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  Kategori get kategori => _kategori;
}

class Kategori {
  Kategori({
    required int id,
    required String nama,
  })   : _id = id,
        _nama = nama;

  Kategori.fromJson(Map<String, dynamic> json)
      : _id = json['id'] ?? 0,
        _nama = json['nama'] ?? '';

  final int _id;
  final String _nama;

  int get id => _id;
  String get nama => _nama;
}