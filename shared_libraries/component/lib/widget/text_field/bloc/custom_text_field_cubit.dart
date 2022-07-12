import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/text_field/bloc/custom_text_field_state.dart';
import 'package:dependencies/bloc/bloc.dart';

class CustomTextFieldCubit extends Cubit<CustomTextFieldState> {
  CustomTextFieldCubit()
      : super(
    CustomTextFieldState(
      customTextFieldState: ViewData.initial(),
    ),
  );

  void isSecureText({required bool isSecured}) {
    emit(
      CustomTextFieldState(
        customTextFieldState: ViewData.loaded(data: !isSecured),
      ),
    );
  }
}