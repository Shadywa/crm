class Customer {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String profilePictureUrl;
  final String emailId;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.emailId,
    required this.phone,
    required this.profilePictureUrl,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      emailId: json['emailId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profilePictureUrl: json['profile_picture_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profile_picture_url': profilePictureUrl,
    };
  }
}
