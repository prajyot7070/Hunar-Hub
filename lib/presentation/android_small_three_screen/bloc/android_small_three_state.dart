// ignore_for_file: must_be_immutable

part of 'android_small_three_bloc.dart';

/// Represents the state of AndroidSmallThree in the application.
class AndroidSmallThreeState extends Equatable {
  AndroidSmallThreeState({this.androidSmallThreeModelObj});

  AndroidSmallThreeModel? androidSmallThreeModelObj;

  @override
  List<Object?> get props => [
        androidSmallThreeModelObj,
      ];
  AndroidSmallThreeState copyWith(
      {AndroidSmallThreeModel? androidSmallThreeModelObj}) {
    return AndroidSmallThreeState(
      androidSmallThreeModelObj:
          androidSmallThreeModelObj ?? this.androidSmallThreeModelObj,
    );
  }
}
