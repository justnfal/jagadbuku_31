/// status : 200
/// message : "success"
/// data : [{"id":2,"user_id":9,"book_id":18,"tanggal_pinjam":"2024-04-01 00:00:00","tanggal_kembali":"2024-04-01 00:00:00","status":"DIPINJAM","created_at":"2024-04-03T07:01:02.000000Z","updated_at":"2024-04-03T07:01:02.000000Z","book":{"id":18,"kategori_id":2,"judul":"Akasha : Neon Genesis Evangelion - Collector's Edition 02","penulis":"Yoshiyuki Sadamoto","penerbit":"m&c!","image":"http://192.168.42.112:8000/images/Evangelion_collection2(1).PNG","tahun_terbit":2023,"deskripsi":"Shinji penasaran dengan pilot Unit-00 yang misterius, Rei, termasuk hubungan dengan ayahnya. Di tengah percobaan aktivasi ulang Unit-00, datang Angel ke-5 yang memiliki sistem penyerangan dan pertahanan sempurna!\n\nDi antara jenis buku lainnya, komik memang disukai oleh semua kalangan mulai dari anak kecil hingga orang dewasa. Alasan komik lebih disukai oleh banyak orang karena disajikan dengan penuh dengan gambar dan cerita yang mengasyikan sehingga mampu menghilangkan rasa bosan di kala waktu senggang.","created_at":"2024-04-03T06:42:55.000000Z","updated_at":"2024-04-03T06:42:55.000000Z"}}]

class ResponsePinjam {
  ResponsePinjam({
    int? status,
    String? message,
    List<DataPeminjaman>? data,}){
    _status = status;
    _message = message;
    _data = data;
  }

  ResponsePinjam.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data']!= null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DataPeminjaman.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  List<DataPeminjaman>? _data;
  ResponsePinjam copyWith({  int? status,
    String? message,
    List<DataPeminjaman>? data,
  }) => ResponsePinjam(  status: status?? _status,
    message: message?? _message,
    data: data?? _data,
  );
  int? get status => _status;
  String? get message => _message;
  List<DataPeminjaman>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data!= null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// user_id : 9
/// book_id : 18
/// tanggal_pinjam : "2024-04-01 00:00:00"
/// tanggal_kembali : "2024-04-01 00:00:00"
/// status : "DIPINJAM"
/// created_at : "2024-04-03T07:01:02.000000Z"
/// updated_at : "2024-04-03T07:01:02.000000Z"
/// book : {"id":18,"kategori_id":2,"judul":"Akasha : Neon Genesis Evangelion - Collector's Edition 02","penulis":"Yoshiyuki Sadamoto","penerbit":"m&c!","image":"http://192.168.42.112:8000/images/Evangelion_collection2(1).PNG","tahun_terbit":2023,"deskripsi":"Shinji penasaran dengan pilot Unit-00 yang misterius, Rei, termasuk hubungan dengan ayahnya. Di tengah percobaan aktivasi ulang Unit-00, datang Angel ke-5 yang memiliki sistem penyerangan dan pertahanan sempurna!\n\nDi antara jenis buku lainnya, komik memang disukai oleh semua kalangan mulai dari anak kecil hingga orang dewasa. Alasan komik lebih disukai oleh banyak orang karena disajikan dengan penuh dengan gambar dan cerita yang mengasyikan sehingga mampu menghilangkan rasa bosan di kala waktu senggang.","created_at":"2024-04-03T06:42:55.000000Z","updated_at":"2024-04-03T06:42:55.000000Z"}

class DataPeminjaman {
  DataPeminjaman({
    int? id,
    int? userId,
    int? bookId,
    String? tanggalPinjam,
    String? tanggalKembali,
    String? status,
    String? createdAt,
    String? updatedAt,
    Book? book,}){
    _id = id;
    _userId = userId;
    _bookId = bookId;
    _tanggalPinjam = tanggalPinjam;
    _tanggalKembali = tanggalKembali;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _book = book;
  }

  DataPeminjaman.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _bookId = json['book_id'];
    _tanggalPinjam = json['tanggal_pinjam'];
    _tanggalKembali = json['tanggal_kembali'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }
  int? _id;
  int? _userId;
  int? _bookId;
  String? _tanggalPinjam;
  String? _tanggalKembali;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  Book? _book;
  DataPeminjaman copyWith({  int? id,
    int? userId,
    int? bookId,
    String? tanggalPinjam,
    String? tanggalKembali,
    String? status,
    String? createdAt,
    String? updatedAt,
    Book? book,
  }) => DataPeminjaman(  id: id ?? _id,
    userId: userId ?? _userId,
    bookId: bookId ?? _bookId,
    tanggalPinjam: tanggalPinjam ?? _tanggalPinjam,
    tanggalKembali: tanggalKembali ?? _tanggalKembali,
    status: status ?? _status,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    book: book ?? _book,
  );
  int? get id => _id;
  int? get userId => _userId;
  int? get bookId => _bookId;
  String? get tanggalPinjam => _tanggalPinjam;
  String? get tanggalKembali => _tanggalKembali;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Book? get book => _book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['book_id'] = _bookId;
    map['tanggal_pinjam'] = _tanggalPinjam;
    map['tanggal_kembali'] = _tanggalKembali;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_book != null) {
      map['book'] = _book?.toJson();
    }
    return map;
  }

}

/// id : 18
/// kategori_id : 2
/// judul : "Akasha : Neon Genesis Evangelion - Collector's Edition 02"
/// penulis : "Yoshiyuki Sadamoto"
/// penerbit : "m&c!"
/// image : "http://192.168.42.112:8000/images/Evangelion_collection2(1).PNG"
/// tahun_terbit : 2023
/// deskripsi : "Shinji penasaran dengan pilot Unit-00 yang misterius, Rei, termasuk hubungan dengan ayahnya. Di tengah percobaan aktivasi ulang Unit-00, datang Angel ke-5 yang memiliki sistem penyerangan dan pertahanan sempurna!\n\nDi antara jenis buku lainnya, komik memang disukai oleh semua kalangan mulai dari anak kecil hingga orang dewasa. Alasan komik lebih disukai oleh banyak orang karena disajikan dengan penuh dengan gambar dan cerita yang mengasyikan sehingga mampu menghilangkan rasa bosan di kala waktu senggang."
/// created_at : "2024-04-03T06:42:55.000000Z"
/// updated_at : "2024-04-03T06:42:55.000000Z"

class Book {
  Book({
    int? id,
    int? kategoriId,
    String? judul,
    String? penulis,
    String? penerbit,
    String? image,
    int? tahunTerbit,
    String? deskripsi,
    String? createdAt,
    String? updatedAt,}){
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
  }

  Book.fromJson(dynamic json) {
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
  Book copyWith({  int? id,
    int? kategoriId,
    String? judul,
    String? penulis,
    String? penerbit,
    String? image,
    int? tahunTerbit,
    String? deskripsi,
    String? createdAt,
    String? updatedAt,
  }) => Book(  id: id ?? _id,
    kategoriId: kategoriId ?? _kategoriId,
    judul: judul ?? _judul,
    penulis: penulis ?? _penulis,
    penerbit: penerbit ?? _penerbit,
    image: image ?? _image,
    tahunTerbit: tahunTerbit ?? _tahunTerbit,
    deskripsi: deskripsi ?? _deskripsi,
    createdAt: createdAt ?? _createdAt,updatedAt: updatedAt ?? _updatedAt,
  );
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
    return map;
  }

}