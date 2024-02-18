// ignore_for_file: must_be_immutable

part of 'user_register_bloc.dart';

/// Represents the state of UserRegister in the application.
class UserRegisterState extends Equatable {
  UserRegisterState({
    this.emailController,
    this.passwordController,
    this.confirmpasswordController,
    this.userRegisterModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? confirmpasswordController;

  UserRegisterModel? userRegisterModelObj;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        confirmpasswordController,
        userRegisterModelObj,
      ];
  UserRegisterState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmpasswordController,
    UserRegisterModel? userRegisterModelObj,
  }) {
    return UserRegisterState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      userRegisterModelObj: userRegisterModelObj ?? this.userRegisterModelObj,
    );
  }
}
