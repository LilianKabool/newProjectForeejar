class RegisterParams {
  final String firstName;
  final String lastName;
  final gender;
  final phone;
  final password;
  final email;
  final birthday;
  final address;

  RegisterParams({
    required this.firstName,
    required this.lastName,
     this.gender,
     this.phone,
    required this.password,
    required this.email,
     this.birthday,
     this.address,
  });

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "phone": phone,
        "password": password,
        "email":email ,
        "Birthday": birthday,
        "address": address,
      };
}
