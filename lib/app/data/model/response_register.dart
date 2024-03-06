/// status : 201
/// message : "success"
/// data : {"nama":"Naufal","username":"naufal","telp":"08138378493","alamat":"Karanganyar","role":"PEMINJAM","updated_at":"2024-02-06T03:26:33.000000Z","created_at":"2024-02-06T03:26:33.000000Z","id":1}

class ResponseRegister {
  ResponseRegister({
    this.status,
    this.message,
    this.data,
  });

  factory ResponseRegister.fromJson(Map<String, dynamic> json) {
    return ResponseRegister(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? DataRegister.fromJson(json['data']) : null,
    );
  }

  final int? status;
  final String? message;
  final DataRegister? data; // properti data menjadi nullable

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (status != null) {
      map['status'] = status!;
    }
    if (message != null) {
      map['message'] = message!;
    }
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class DataRegister {
  DataRegister({
    this.nama,
    this.username,
    this.telp,
    this.alamat,
    this.role,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory DataRegister.fromJson(Map<String, dynamic> json) {
    return DataRegister(
      nama: json['nama'],
      username: json['username'],
      telp: json['telp'],
      alamat: json['alamat'],
      role: json['role'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  final String? nama; // properti nama menjadi nullable
  final String? username; // properti username menjadi nullable
  final String? telp; // properti telp menjadi nullable
  final String? alamat; // properti alamat menjadi nullable
  final String? role; // properti role menjadi nullable
  final String? updatedAt; // properti updatedAt menjadi nullable
  final String? createdAt; // properti createdAt menjadi nullable
  final int? id; // properti id menjadi nullable

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (nama != null) {
      map['nama'] = nama!;
    }
    if (username != null) {
      map['username'] = username!;
    }
    if (telp != null) {
      map['telp'] = telp!;
    }
    if (alamat != null) {
      map['alamat'] = alamat!;
    }
    if (role != null) {
      map['role'] = role!;
    }
    if (updatedAt != null) {
      map['updated_at'] = updatedAt!;
    }
    if (createdAt != null) {
      map['created_at'] = createdAt!;
    }
    if (id != null) {
      map['id'] = id!;
    }
    return map;
  }
}