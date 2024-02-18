// ignore_for_file: must_be_immutable

part of 'login_choice_bloc.dart';

/// Represents the state of LoginChoice in the application.
class LoginChoiceState extends Equatable {
  LoginChoiceState({this.loginChoiceModelObj});

  LoginChoiceModel? loginChoiceModelObj;

  @override
  List<Object?> get props => [
        loginChoiceModelObj,
      ];
  LoginChoiceState copyWith({LoginChoiceModel? loginChoiceModelObj}) {
    return LoginChoiceState(
      loginChoiceModelObj: loginChoiceModelObj ?? this.loginChoiceModelObj,
    );
  }
}
