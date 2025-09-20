class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String birthDate;
  final String? avatar;
  final String? degree;
  final String? institute;
  final String? batchYear;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.birthDate,
    this.avatar,
    this.degree,
    this.institute,
    this.batchYear,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      birthDate: json['birthDate'] ?? '',
      avatar: json['avatar'],
      degree: json['degree'],
      institute: json['institute'],
      batchYear: json['batchYear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'birthDate': birthDate,
      'avatar': avatar,
      'degree': degree,
      'institute': institute,
      'batchYear': batchYear,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? birthDate,
    String? avatar,
    String? degree,
    String? institute,
    String? batchYear,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      birthDate: birthDate ?? this.birthDate,
      avatar: avatar ?? this.avatar,
      degree: degree ?? this.degree,
      institute: institute ?? this.institute,
      batchYear: batchYear ?? this.batchYear,
    );
  }
}
