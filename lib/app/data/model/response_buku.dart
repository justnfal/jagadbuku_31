/// status : 201
/// message : "success"
/// data : {"kategori_id":"2","judul":"Akasha : Neon Genesis Evangelion - Collector's Edition 02","penulis":"Yoshiyuki Sadamoto","penerbit":"m&c!","image":"http://192.168.6.31:8000/images/Evangelion_collection2.PNG","tahun_terbit":"2023","deskripsi":"Shinji penasaran dengan pilot Unit-00 yang misterius, Rei, termasuk hubungan dengan ayahnya. Di tengah percobaan aktivasi ulang Unit-00, datang Angel ke-5 yang memiliki sistem penyerangan dan pertahanan sempurna!\n\nDi antara jenis buku lainnya, komik memang disukai oleh semua kalangan mulai dari anak kecil hingga orang dewasa. Alasan komik lebih disukai oleh banyak orang karena disajikan dengan penuh dengan gambar dan cerita yang mengasyikan sehingga mampu menghilangkan rasa bosan di kala waktu senggang.","updated_at":"2024-04-01T02:17:27.000000Z","created_at":"2024-04-01T02:17:27.000000Z","id":10}

class ResponseBuku {
  int? status;
  String? message;
  List<DataBuku>? data; // Ubah tipe data menjadi List<DataBuku>?

  ResponseBuku({this.status, this.message, this.data});

  ResponseBuku.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    // Penanganan data untuk data tunggal atau dalam bentuk list
    if (json['data'] != null) {
      if (json['data'] is List) {
        data = List<DataBuku>.from(json['data'].map((x) => DataBuku.fromJson(x)));
      } else {
        data = [DataBuku.fromJson(json['data'])];
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class DataBuku {
  String? kategoriId; // Ubah tipe data menjadi String?
  String? judul;
  String? penulis;
  String? penerbit;
  String? image;
  String? tahunTerbit; // Ubah tipe data menjadi String?
  String? deskripsi;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataBuku({
    this.kategoriId,
    this.judul,
    this.penulis,
    this.penerbit,
    this.image,
    this.tahunTerbit,
    this.deskripsi,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  DataBuku.fromJson(Map<String, dynamic> json) {
    kategoriId = json['kategori_id'].toString(); // Konversi ke String
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    image = json['image'];
    tahunTerbit = json['tahun_terbit'].toString(); // Konversi ke String
    deskripsi = json['deskripsi'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['kategori_id'] = kategoriId;
    data['judul'] = judul;
    data['penulis'] = penulis;
    data['penerbit'] = penerbit;
    data['image'] = image;
    data['tahun_terbit'] = tahunTerbit;
    data['deskripsi'] = deskripsi;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
