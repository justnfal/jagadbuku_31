class ResponseLogin {
  ResponseLogin({
    required this.status,
    required this.message,
    this.data,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) {
    return ResponseLogin(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? DataLogin.fromJson(json['data']) : null,
    );
  }

  final int status;
  final String message;
  final DataLogin? data; // properti data menjadi nullable

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'status': status,
      'message': message,
    };
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class DataLogin {
  DataLogin({
    this.id,
    this.username,
    this.nama,
    this.telp,
    this.alamat,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory DataLogin.fromJson(Map<String, dynamic> json) {
    return DataLogin(
      id: json['id'],
      username: json['username'],
      nama: json['nama'],
      telp: json['telp'],
      alamat: json['alamat'],
      role: json['role'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  final int? id; // properti id menjadi nullable
  final String? username; // properti username menjadi nullable
  final String? nama; // properti nama menjadi nullable
  final String? telp; // properti telp menjadi nullable
  final String? alamat; // properti alamat menjadi nullable
  final String? role; // properti role menjadi nullable
  final String? createdAt; // properti createdAt menjadi nullable
  final String? updatedAt; // properti updatedAt menjadi nullable

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (id != null) {
      map['id'] = id!;
    }
    if (username != null) {
      map['username'] = username!;
    }
    if (nama != null) {
      map['nama'] = nama!;
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
    if (createdAt != null) {
      map['created_at'] = createdAt!;
    }
    if (updatedAt != null) {
      map['updated_at'] = updatedAt!;
    }
    return map;
  }
}
