import 'package:dependencies/equatable/equatable.dart';

class FailureResponse extends Equatable {
  final String errorMessage;
  final int? statusCode;

  const FailureResponse({
    required this.errorMessage,
    this.statusCode = 500,
  });

  @override
  List<Object?> get props => [errorMessage, statusCode];
}
