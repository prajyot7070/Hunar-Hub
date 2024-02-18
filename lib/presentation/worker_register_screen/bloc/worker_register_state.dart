// ignore_for_file: must_be_immutable

part of 'worker_register_bloc.dart';

/// Represents the state of WorkerRegister in the application.
class WorkerRegisterState extends Equatable {
  WorkerRegisterState({
    this.emailController,
    this.passwordController,
    this.confirmpasswordController,
    this.workerRegisterModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? confirmpasswordController;

  WorkerRegisterModel? workerRegisterModelObj;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        confirmpasswordController,
        workerRegisterModelObj,
      ];
  WorkerRegisterState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmpasswordController,
    WorkerRegisterModel? workerRegisterModelObj,
  }) {
    return WorkerRegisterState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      workerRegisterModelObj:
          workerRegisterModelObj ?? this.workerRegisterModelObj,
    );
  }
}
