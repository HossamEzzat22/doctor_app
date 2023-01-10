class Authentication {
  Doctor? data;
  String? token;
  String? message;
  int? code;

  Authentication({this.data, this.token, this.message, this.code, });

  Authentication.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Doctor.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['message'] = this.message;
    data['code'] = this.code;

    return data;
  }
}

class Doctor {
  int? id;
  String? name;
  String? email;
  String? title;
  String? address;
  String? createdAt;
  String? updatedAt;

  Doctor(
      {this.id,
        this.name,
        this.email,
        this.title,
        this.address,
        this.createdAt,
        this.updatedAt});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    title = json['title'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}