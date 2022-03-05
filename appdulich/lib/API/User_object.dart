class Users {
  int? id;
  String? name;
  String? email;
  String? password;
  int? status;
  String? avatar;
  String? quyen;
  String? phone;
  String? old;
  String? createdAt;
  String? updatedAt;

  Users(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.status,
      this.avatar,
      this.phone,
      this.old,
      this.quyen,
      this.createdAt,
      this.updatedAt});

  Users.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        password = json['password'],
        status = json['status'],
        avatar = json['avatar'],
        phone = json['phone'],
        old = json['old'],
        quyen = json['Quyen'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}
