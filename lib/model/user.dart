class Users {
  final String id;
  final String name;
  final String vehicleNumber;
  final String email;
  final String phonenumber;

  Users(
      {required this.id,
      required this.phonenumber,
      required this.name,
      required this.vehicleNumber,
      required this.email});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'vehiclenumber': vehicleNumber,
        'phonenumber': phonenumber
      };

  static Users fromJson(Map<String, dynamic> json) => Users(
      id: json['id'],
      phonenumber: json['phonenumber'],
      name: json['name'],
      vehicleNumber: json['vehicleNumber'],
      email: json['email']);
}
