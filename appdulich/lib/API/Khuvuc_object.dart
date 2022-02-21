class khuvuc {
  int? id;
  String? ten;
  String? makhuvuc;
 String? createdAt;
  String? updatedAt;

  khuvuc({this.id, this.ten, this.makhuvuc, this.createdAt, this.updatedAt});

  khuvuc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ten = json['Ten'];
    makhuvuc = json['Makhuvuc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
