class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String details;

  Product({
    required this .id,
    required this .name,
    required this .price,
    required this .imageUrl,
    required this .details,
  });
}
class User {
  String email;
  String password;

  User({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}