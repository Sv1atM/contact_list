class Person {
  String name;
  String surname;
  int mobile;
  String company;
  String? photo;
  String? bio;
  bool isFavorite;

  Person({
    required this.name,
    required this.surname,
    required this.mobile,
    required this.company,
    this.photo,
    this.bio,
    this.isFavorite = false,
  });

  factory Person.clone(Person person) => Person(
        name: person.name,
        surname: person.surname,
        mobile: person.mobile,
        company: person.company,
        photo: person.photo,
        bio: person.bio,
        isFavorite: person.isFavorite,
      );
}
