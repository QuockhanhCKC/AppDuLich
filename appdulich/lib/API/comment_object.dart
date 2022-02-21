class comment {
  int? id;
  String? noidung;
  String? ngaydang;
  int? iduser;
  int? idpost;
String? createdAt;
  String? updatedAt;

  comment(
      {this.id,
      this.noidung,
      this.ngaydang,
      this.iduser,
      this.idpost,
      this.createdAt,
      this.updatedAt});

  comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noidung = json['Noidung'];
    ngaydang = json['Ngaydang'];
    iduser = json['iduser'];
   idpost = json['idpost'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

 
}
