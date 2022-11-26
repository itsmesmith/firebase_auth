class UserModel {
  String? id;
  final String? name;
  final int? age;
  final String? address;
  final String? email;
  final int? mobile;

  UserModel({
    this.id,
    this.name,
    this.address,
    this.age,
    this.email,
    this.mobile,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["name"] = name;
    data['address'] = address;
    data['age'] = age;
    data['email'] = email;
    data['mobile'] = mobile;

    return data;
  }

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      address: data['address'],
      age: data['age'],
      email: data['email'],
      mobile: data['mobile'],
    );
  }
}
