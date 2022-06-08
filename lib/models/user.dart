class Users {
  final String email;
  final String fullname;
  final String gender;
  final String birthday;
  final String phone;
  final String address;
  final String img;
  Users(
      {required this.email,
      required this.fullname,
      required this.gender,
      required this.birthday,
      required this.phone,
      required this.address,
      required this.img});

  // Users.fromJson(Map<String, Object?> json)
  //     : this(
  //         email: json['title']! as String,
  //         fullname: json['fullname']! as String,
  //         gender: json['gender']! as String,
  //         birthday: json['birthday']! as String,
  //         phone: json['phone']! as String,
  //         address: json['address']! as String,
  //         img: json['img']! as String,
  //       );

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullname': fullname,
      'gender': gender,
      'birthday': birthday,
      'phone': phone,
      'address': address,
      'img': img,
    };
  }

  Users.fromMap(Map<String, dynamic> users)
      : email = users["email"],
        fullname = users["fullname"],
        gender = users["gender"],
        birthday = users["birthday"],
        phone = users["phone"],
        address = users["address"],
        img = users["img"];

  // Map<String, Object?> toJson() {
  //   return {
  //     'email': email,
  //     'fullname': fullname,
  //     'gender': gender,
  //     'birthday': birthday,
  //     'phone': phone,
  //     'address': address,
  //     'img': img,
  //   };
  // }
}
