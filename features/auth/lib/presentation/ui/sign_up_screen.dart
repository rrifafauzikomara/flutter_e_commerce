import 'package:auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:auth/presentation/bloc/sign_up_bloc/sign_up_event.dart';
import 'package:auth/presentation/bloc/sign_up_bloc/sign_up_state.dart';
import 'package:authentication/domain/entities/body/auth_request_entity.dart';
import 'package:common/utils/constants/app_constants.dart';
import 'package:common/utils/navigation/router/auth_router.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:component/widget/button/custom_button.dart';
import 'package:component/widget/stack/loading_stack.dart';
import 'package:component/widget/text_field/custom_text_field.dart';
import 'package:component/widget/toast/custom_toast.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final AuthRouter _authRouter = sl();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorName.orange,
          ),
          onPressed: _authRouter.goBack,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Daftar",
          style: TextStyle(
            color: ColorName.orange,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          final status = state.signUpState.status;
          if (status.isHasData) {
            _authRouter.navigateToHome();
          }
          if (status.isError) {
            if (state.signUpState.message != AppConstants.errorKey.username &&
                state.signUpState.message != AppConstants.errorKey.password &&
                state.signUpState.message !=
                    AppConstants.errorKey.confirmPassword) {
              CustomToast.showErrorToast(
                errorMessage: state.signUpState.message,
              );
            }
          }
        },
        builder: (context, state) {
          final status = state.signUpState.status;
          return LoadingStack(
            isLoading: status.isLoading,
            widget: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                SizedBox(
                  height: 47.h,
                ),
                CustomTextField(
                  labelText: "Username",
                  controller: usernameController,
                  errorText: state.signUpState.message ==
                          AppConstants.errorKey.username
                      ? state.signUpState.failure!.errorMessage
                      : "",
                  onChanged: (value) => context.read<SignUpBloc>().add(
                        UserNameChange(username: value),
                      ),
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  labelText: "Password",
                  controller: passwordController,
                  errorText: state.signUpState.message ==
                          AppConstants.errorKey.password
                      ? state.signUpState.failure!.errorMessage
                      : "",
                  onChanged: (value) => context.read<SignUpBloc>().add(
                        PasswordChange(password: value),
                      ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  labelText: "Konfirmasi Password",
                  controller: confirmPasswordController,
                  errorText: state.signUpState.message ==
                          AppConstants.errorKey.confirmPassword
                      ? state.signUpState.failure!.errorMessage
                      : "",
                  onChanged: (value) => context.read<SignUpBloc>().add(
                        ConfirmPasswordChange(
                          password: passwordController.text,
                          confirmPassword: value,
                        ),
                      ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 39.h,
                ),
                CustomButton(
                  buttonText: "Daftar",
                  onTap: () => context.read<SignUpBloc>().add(
                        SignUp(
                          authRequestEntity: AuthRequestEntity(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        ),
                      ),
                ),
                SizedBox(
                  height: 39.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
