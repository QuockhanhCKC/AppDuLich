class Address {
  int? id;
  String? toadoX;
  String? toadoY;
  String? createdAt;
  String? updatedAt;

  Address({this.id, this.toadoX, this.toadoY, this.createdAt, this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    toadoX = json['toadoX'];
    toadoY = json['toadoY'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
