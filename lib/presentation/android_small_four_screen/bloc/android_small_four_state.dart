// ignore_for_file: must_be_immutable

part of 'android_small_four_bloc.dart';

/// Represents the state of AndroidSmallFour in the application.
class AndroidSmallFourState extends Equatable {
  AndroidSmallFourState({this.androidSmallFourModelObj});

  AndroidSmallFourModel? androidSmallFourModelObj;

  @override
  List<Object?> get props => [
        androidSmallFourModelObj,
      ];
  AndroidSmallFourState copyWith(
      {AndroidSmallFourModel? androidSmallFourModelObj}) {
    return AndroidSmallFourState(
      androidSmallFourModelObj:
          androidSmallFourModelObj ?? this.androidSmallFourModelObj,
    );
  }
}
