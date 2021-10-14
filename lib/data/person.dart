class Person {
  final String name;
  final String surname;
  final String company;
  final String? photo;
  bool isFavorite = false;

  Person({
    required this.name,
    required this.surname,
    required this.company,
    this.photo,
  });
}
