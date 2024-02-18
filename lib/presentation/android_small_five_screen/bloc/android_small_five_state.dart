// ignore_for_file: must_be_immutable

part of 'android_small_five_bloc.dart';

/// Represents the state of AndroidSmallFive in the application.
class AndroidSmallFiveState extends Equatable {
  AndroidSmallFiveState({
    this.nameEditTextController,
    this.phoneEditTextController,
    this.ageEditTextController,
    this.androidSmallFiveModelObj,
  });

  TextEditingController? nameEditTextController;

  TextEditingController? phoneEditTextController;

  TextEditingController? ageEditTextController;   

  AndroidSmallFiveModel? androidSmallFiveModelObj;

  @override
  List<Object?> get props => [
        nameEditTextController,
        phoneEditTextController,
        ageEditTextController,
        androidSmallFiveModelObj,
      ];


  get selectedGender => null;
  AndroidSmallFiveState copyWith({
    TextEditingController? nameEditTextController,
    TextEditingController? phoneEditTextController,
    TextEditingController? ageEditTextController, 
    AndroidSmallFiveModel? androidSmallFiveModelObj,
  }) {
    return AndroidSmallFiveState(
      nameEditTextController:
          nameEditTextController ?? this.nameEditTextController,
      phoneEditTextController:
          phoneEditTextController ?? this.phoneEditTextController,
      ageEditTextController:
          ageEditTextController ?? this.ageEditTextController,
      androidSmallFiveModelObj:
          androidSmallFiveModelObj ?? this.androidSmallFiveModelObj,
    );
  }
}