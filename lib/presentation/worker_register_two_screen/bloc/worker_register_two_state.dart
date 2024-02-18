// ignore_for_file: must_be_immutable

part of 'worker_register_two_bloc.dart';

/// Represents the state of WorkerRegisterTwo in the application.
class WorkerRegisterTwoState extends Equatable {
  WorkerRegisterTwoState({
    this.nameController,
    this.phoneController,
    this.locationController,
    this.workerRegisterTwoModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? phoneController;

  TextEditingController? locationController;

  WorkerRegisterTwoModel? workerRegisterTwoModelObj;

  @override
  List<Object?> get props => [
        nameController,
        phoneController,
        locationController,
        workerRegisterTwoModelObj,
      ];
  WorkerRegisterTwoState copyWith({
    TextEditingController? nameController,
    TextEditingController? phoneController,
    TextEditingController? locationController,
    WorkerRegisterTwoModel? workerRegisterTwoModelObj,
  }) {
    return WorkerRegisterTwoState(
      nameController: nameController ?? this.nameController,
      phoneController: phoneController ?? this.phoneController,
      locationController: locationController ?? this.locationController,
      workerRegisterTwoModelObj:
          workerRegisterTwoModelObj ?? this.workerRegisterTwoModelObj,
    );
  }
}
