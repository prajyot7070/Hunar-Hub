import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [my_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MyProfileModel extends Equatable {
  final String name;
  final String phone;
  final String location;
  final String gender;
  MyProfileModel({
    required this.name,
    required this.phone,
    required this.location,
    required this.gender,
  });

  MyProfileModel copyWith({
    String? name,
    String? phone,
    String? location,
    String? gender,
  }) {
    return MyProfileModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [name, phone];
}
