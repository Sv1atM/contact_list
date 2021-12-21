import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final String surname;
  final int mobile;
  final String company;
  final String? photo;
  final String? bio;
  final bool isFavorite;

  const Person({
    required this.name,
    required this.surname,
    required this.mobile,
    required this.company,
    this.photo,
    this.bio,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        name,
        surname,
        mobile,
        company,
        photo,
        bio,
        isFavorite,
      ];

  Person copyWith({
    String? name,
    String? surname,
    int? mobile,
    String? company,
    String? photo,
    String? bio,
    bool? isFavorite,
  }) {
    return Person(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      mobile: mobile ?? this.mobile,
      company: company ?? this.company,
      photo: photo ?? this.photo,
      bio: bio ?? this.bio,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
