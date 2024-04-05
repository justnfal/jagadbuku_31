/// status : 200
/// message : "success"
/// data : [{"id":1,"user_id":9,"book_id":11,"created_at":"2024-04-05T03:36:25.000000Z","updated_at":"2024-04-05T03:36:25.000000Z","book":{"id":11,"judul":"Akasha : Neon Genesis Evangelion - Collector's Edition 02","penulis":"Yoshiyuki Sadamoto","penerbit":"m&c!","tahun_terbit":2023,"kategori_id":2,"kategori":{"id":2,"nama":"hiburan"}}}]

class ResponseKoleksi {
  ResponseKoleksi({
    this.status,
    this.message,
    this.data,
  });

  ResponseKoleksi.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data']!= null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(DataKoleksi.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataKoleksi>? data;

  ResponseKoleksi copyWith({
    int? status,
    String? message,
    List<DataKoleksi>? data,
  }) =>
      ResponseKoleksi(
        status: status?? this.status,
        message: message?? this.message,
        data: data?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data!= null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataKoleksi {
  DataKoleksi({
    this.id,
    this.userId,
    this.bookId,
    this.createdAt,
    this.updatedAt,
    this.book,
  });

  DataKoleksi.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    book = json['book']!= null? Book.fromJson(json['book']) : null;
  }
  int? id;
  int? userId;
  int? bookId;
  String? createdAt;
  String? updatedAt;
  Book? book;

  DataKoleksi copyWith({
    int? id,
    int? userId,
    int? bookId,
    String? createdAt,
    String? updatedAt,
    Book? book,
  }) =>
      DataKoleksi(
        id: id?? this.id,
        userId: userId?? this.userId,
        bookId: bookId?? this.bookId,
        createdAt: createdAt?? this.createdAt,
        updatedAt: updatedAt?? this.updatedAt,
        book: book?? this.book,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (book!= null) {
      map['book'] = book!.toJson();
    }
    return map;
  }
}

class Book {
  Book({
    this.id,
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.kategoriId,
    this.kategori,
  });

  Book.fromJson(dynamic json) {
    id = json['id'];
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    kategoriId = json['kategori_id'];
    kategori = json['kategori']!= null? Kategori.fromJson(json['kategori']) : null;
  }
  int? id;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  int? kategoriId;
  Kategori? kategori;

  Book copyWith({
    int? id,
    String? judul,
    String? penulis,
    String? penerbit,
    int? tahunTerbit,
    int? kategoriId,
    Kategori? kategori,
  }) =>
      Book(
        id: id?? this.id,
        judul: judul?? this.judul,
        penulis: penulis?? this.penulis,
        penerbit: penerbit?? this.penerbit,
        tahunTerbit: tahunTerbit?? this.tahunTerbit,
        kategoriId: kategoriId?? this.kategoriId,
        kategori: kategori?? this.kategori,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['judul'] = judul;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['kategori_id'] = kategoriId;
    if (kategori!= null) {
      map['kategori'] = kategori!.toJson();
    }
    return map;
  }
}

class Kategori{
  Kategori({
    this.id,
    this.nama,
  });

  Kategori.fromJson(dynamic json) {
    id = json['id'];
    nama = json['nama'];
  }
  int? id;
  String? nama;

  Kategori copyWith({
    int? id,
    String? nama,
  }) =>
      Kategori(
        id: id?? this.id,
        nama: nama?? this.nama,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nama'] = nama;
    return map;
  }
}