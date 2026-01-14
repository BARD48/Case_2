class UserModel {
  final String uid;
  final String mail;
  final String name;
  final String city;

  UserModel({
    required this.uid,
    required this.mail,
    required this.name,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'mail': mail, 'name': name, 'city': city};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      mail: json['mail'],
      name: json['name'],
      city: json['city'],
    );
  }
}
