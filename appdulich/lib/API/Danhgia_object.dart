class danhgia {
  int? id;
  String? noidung;
  String? ngaydang;
  int? iduser;
  int? idDiadanh;
String? createdAt;
  String? updatedAt;

  danhgia(
      {this.id,
      this.noidung,
      this.ngaydang,
      this.iduser,
      this.idDiadanh,
      this.createdAt,
      this.updatedAt});

  danhgia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noidung = json['Noidung'];
    ngaydang = json['Ngaydang'];
    iduser = json['iduser'];
    idDiadanh = json['idDiadanh'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}