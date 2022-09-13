class UserModel {
  String? fname;
  String? lname;
  String? level;
  String? address;
  String? subdistrict;
  String? district;
  String? province;
  String? zipcode;
  String? phone;
  String? email;
  String? password;
  String? images;
  String? token;


  UserModel(
      {
      this.fname,
      this.lname,
      this.level,
      this.address,
      this.subdistrict,
      this.district,
      this.province,
      this.zipcode,
      this.phone,
      this.email,
      this.password,
      this.images,
      this.token,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    level = json['level'];
    address = json['address'];
    subdistrict = json['subdistrict'];
    district = json['district'];
    province = json['province'];
    zipcode = json['zipcode'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    images = json['images'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['level'] = this.level;
    data['address'] = this.address;
    data['subdistrict'] = this.subdistrict;
    data['district'] = this.district;
    data['province'] = this.province;
    data['zipcode'] = this.zipcode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['images'] = this.images;
    data['token'] = this.token;
    return data;
  }
  

}
