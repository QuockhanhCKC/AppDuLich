class Dichvu {
  int? id;
  String? name;
  String? mota;
  String? imagedichvu;
  int? status;
  String? khuvuc;
  String? diachi;
  String? loai;
  int? toaDo;
  int? luotLike;
  int? disLike;
  int? luotXem;
  String? createdAt;
  String? updatedAt;

  Dichvu(
      {this.id,
      this.name,
      this.mota,
      this.imagedichvu,
      this.status,
      this.khuvuc,
      this.diachi,
      this.loai,
      this.toaDo,
      this.luotLike,
      this.disLike,
      this.luotXem,
      this.createdAt,
      this.updatedAt});

  Dichvu.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    mota = json['mota'],
    imagedichvu = json['imagedichvu'],
    status = json['status'],
    khuvuc = json['khuvuc'],
    diachi = json['diachi'],
    loai = json['loai'],
    toaDo = json['toaDo'],
    luotLike = json['LuotLike'],
    disLike = json['DisLike'],
    luotXem = json['luot_xem'],
    createdAt = json['created_at'],
    updatedAt = json['updated_at'];
  }

  
  