import 'package:dependencies/equatable/equatable.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();
}

class FullNameChange extends EditProfileEvent {
  final String fullName;

  const FullNameChange({required this.fullName});

  @override
  List<Object?> get props => [fullName];
}

class AddressChange extends EditProfileEvent {
  final String address;

  const AddressChange({required this.address});

  @override
  List<Object?> get props => [address];
}

class EditProfile extends EditProfileEvent {
  final String fullName;
  final String address;

  const EditProfile({required this.fullName, required this.address});

  @override
  List<Object?> get props => [fullName, address];
}
