// ignore_for_file: must_be_immutable

part of 'my_profile_bloc.dart';

/// Represents the state of MyProfile in the application.
class MyProfileState extends Equatable {
  MyProfileState({this.myProfileModelObj});

  MyProfileModel? myProfileModelObj;

  @override
  List<Object?> get props => [
        myProfileModelObj,
      ];
  MyProfileState copyWith({MyProfileModel? myProfileModelObj}) {
    return MyProfileState(
      myProfileModelObj: myProfileModelObj ?? this.myProfileModelObj,
    );
  }
}
