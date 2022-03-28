class Doctor{
  final String email;
  final String password;
  final String hcp;

  Doctor({ required this.email, required this.password, required this.hcp});

  factory Doctor.fromJson(Map<String, dynamic> json){
    print(json);
    return Doctor(
      email: json['email'] as String,
      hcp: json['hcp'] as String,
      password: json['password'] as String,
    );
  }
}