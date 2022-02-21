class Post {
  int? id;
  String? noidung;
  String? ngaydang;
  int? luotLike;
  int? disLike;
  int? luotXem;
  int? iduser;
  String? statust;
  String? image;
  int? idDiadanh;
String? createdAt;
  String? updatedAt;

  Post(
      {this.id,
      this.noidung,
      this.ngaydang,
      this.luotLike,
      this.disLike,
      this.luotXem,
      this.iduser,
      this.statust,
      this.image,
      this.idDiadanh,
      this.createdAt,
      this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    noidung = json['Noidung'],
    ngaydang = json['Ngaydang'],
    luotLike = json['LuotLike'],
    disLike = json['DisLike'],
    luotXem = json['luot_xem'],
    iduser = json['iduser'],
    statust = json['statust'],
    image = json['image'],
    idDiadanh = json['idDiadanh'],
    createdAt = json['created_at'],
    updatedAt = json['updated_at'];
  }
