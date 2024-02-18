// ignore_for_file: must_be_immutable

part of 'worker_login_bloc.dart';

/// Represents the state of WorkerLogin in the application.
class WorkerLoginState extends Equatable {
  WorkerLoginState({
    this.userNameController,
    this.passwordController,
    this.workerLoginModelObj,
  });

  TextEditingController? userNameController;

  TextEditingController? passwordController;

  WorkerLoginModel? workerLoginModelObj;

  @override
  List<Object?> get props => [
        userNameController,
        passwordController,
        workerLoginModelObj,
      ];
  WorkerLoginState copyWith({
    TextEditingController? userNameController,
    TextEditingController? passwordController,
    WorkerLoginModel? workerLoginModelObj,
  }) {
    return WorkerLoginState(
      userNameController: userNameController ?? this.userNameController,
      passwordController: passwordController ?? this.passwordController,
      workerLoginModelObj: workerLoginModelObj ?? this.workerLoginModelObj,
    );
  }
}
