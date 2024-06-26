/// status : 200
/// message : "Success"
/// data : {"id":1,"username":"naufal","nama":"Naufal","telp":"08138378493","alamat":"Karanganyar","role":"ADMIN","created_at":"2024-02-12T07:20:38.000000Z","updated_at":"2024-02-12T07:20:38.000000Z"}

class ResponseUser {
  ResponseUser({
    int? status,
    String? message,
    DataUser? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  ResponseUser.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
  }

  int? _status;
  String? _message;
  DataUser? _data;

  int? get status => _status;
  String? get message => _message;
  DataUser? get data => _data;

  ResponseUser copyWith({
    int? status,
    String? message,
    DataUser? data,
  }) =>
      ResponseUser(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data!.toJson();
    }
    return map;
  }
}

class DataUser {
  DataUser({
    int? id,
    String? username,
    String? nama,
    String? telp,
    String? alamat,
    String? role,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _username = username;
    _nama = nama;
    _telp = telp;
    _alamat = alamat;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  DataUser.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _nama = json['nama'];
    _telp = json['telp'];
    _alamat = json['alamat'];
    _role = json['role'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _username;
  String? _nama;
  String? _telp;
  String? _alamat;
  String? _role;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get username => _username;
  String? get nama => _nama;
  String? get telp => _telp;
  String? get alamat => _alamat;
  String? get role => _role;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['nama'] = _nama;
    map['telp'] = _telp;
    map['alamat'] = _alamat;
    map['role'] = _role;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
