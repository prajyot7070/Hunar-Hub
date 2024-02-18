// ignore_for_file: must_be_immutable

part of 'user_profile_bloc.dart';

/// Represents the state of UserProfile in the application.
class UserProfileState extends Equatable {
  UserProfileState({this.userProfileModelObj});

  UserProfileModel? userProfileModelObj;

  @override
  List<Object?> get props => [
        userProfileModelObj,
      ];
  UserProfileState copyWith({UserProfileModel? userProfileModelObj}) {
    return UserProfileState(
      userProfileModelObj: userProfileModelObj ?? this.userProfileModelObj,
    );
  }
}
