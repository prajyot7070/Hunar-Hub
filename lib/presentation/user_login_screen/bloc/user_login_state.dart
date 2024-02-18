// ignore_for_file: must_be_immutable

part of 'user_login_bloc.dart';

/// Represents the state of UserLogin in the application.
class UserLoginState extends Equatable {
  UserLoginState({
    this.userNameController,
    this.passwordController,
    this.userLoginModelObj,
  });

  TextEditingController? userNameController;

  TextEditingController? passwordController;

  UserLoginModel? userLoginModelObj;

  @override
  List<Object?> get props => [
        userNameController,
        passwordController,
        userLoginModelObj,
      ];
  UserLoginState copyWith({
    TextEditingController? userNameController,
    TextEditingController? passwordController,
    UserLoginModel? userLoginModelObj,
  }) {
    return UserLoginState(
      userNameController: userNameController ?? this.userNameController,
      passwordController: passwordController ?? this.passwordController,
      userLoginModelObj: userLoginModelObj ?? this.userLoginModelObj,
    );
  }
}
