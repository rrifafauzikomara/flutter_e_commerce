import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';

class CustomTextFieldState extends Equatable {
  final ViewData<bool> customTextFieldState;

  const CustomTextFieldState({
    required this.customTextFieldState,
  });

  CustomTextFieldState copyWith({
    ViewData<bool>? customTextFieldState,
  }) {
    return CustomTextFieldState(
      customTextFieldState: customTextFieldState ?? this.customTextFieldState,
    );
  }

  @override
  List<Object?> get props => [customTextFieldState];
}