import 'package:dependencies/equatable/equatable.dart';

class SellerDataEntity extends Equatable {
  const SellerDataEntity({
    this.id = "",
    this.username = "",
    this.role = "",
    this.imageUrl = "",
    this.fullName = "",
    this.city = "",
    this.simpleAddress = "",
  });

  final String id;
  final String username;
  final String role;
  final String imageUrl;
  final String fullName;
  final String city;
  final String simpleAddress;

  @override
  List<Object?> get props => [
        id,
        username,
        role,
        imageUrl,
        fullName,
        city,
        simpleAddress,
      ];
}
