import '../../ApiRouts.dart';

class User {
  User({
      this.id, 
      this.username, 
      this.fullname, 
      this.email, 
      this.photo, 
      this.cover, 
      this.job, 
      this.location, 
      this.lat, 
      this.lng, 
      this.userType,
      this.status,
      required this.packageManagementId,
      this.expireDate,
      this.userLink,
      this.token,});

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    fullname = json['fullname'];
    email = json['email'];
    photo = json['photo'];
    cover = json['cover'];
    job = json['job'];
    location = json['location'];
    lat = json['lat'];
    lng = json['lng'];
    userType = json['user_type'];
    userLink = json['deep_link'];
    status = json['status'];
    packageManagementId = json['package_management_id'];
    expireDate = json['expire_date'];
    token = json['token'];
  }

  User.copyWith({
    int? id,
    String? username,
    String? fullname,
    String? email,
    String? photo,
    String? cover,
    String? job,
    String? location,
    String? lat,
    String? lng,
    String? userType,
    String? status,
    int? packageManagementId,
    String? expireDate,
    String? userLink,
    String? token,}) {
    id = id;
    this.username = username??this.username;
    this.fullname = fullname??this.fullname;
    this.email = email??this.email;
    this.photo = photo??this.photo;
    this.cover = cover??this.cover;
    this.job = job??this.job;
    this.location = location??this.location;
    this.lat = lat??this.lat;
    this.lng = lng??this.lng;
    this.userType = userType??this.userType;
    this.status = status??this.status;
    this.packageManagementId = packageManagementId??this.packageManagementId;
    this.expireDate = expireDate??this.expireDate;
    this.token = token??this.token;
    this.userLink = userLink??this.userLink;
  }

  int? id;
  String? username;
  String? fullname;
  String? email;
  String? photo;
  String? cover;
  dynamic job;
  dynamic location;
  dynamic lat;
  dynamic lng;
  String? userType;
  String? status;
  int? packageManagementId;
  dynamic expireDate;
  String? token;
  String? userLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['fullname'] = fullname;
    map['email'] = email;
    map['photo'] = photo;
    map['cover'] = cover;
    map['job'] = job;
    map['location'] = location;
    map['lat'] = lat;
    map['lng'] = lng;
    map['user_type'] = userType;
    map['status'] = status;
    map['package_management_id'] = packageManagementId;
    map['expire_date'] = expireDate;
    map['token'] = token;
    map['deep_link'] = userLink;
    return map;
  }

  @override
  String toString() {
    return "$username $fullname $id ::: \n ${token}";
  }

  String? get getFullPathImg => photo != null ? mainAppUrlDomain + (photo ?? "") : null;
  String? get getFullPathCover => cover != null ? mainAppUrlDomain + (cover ?? "") : null;
}