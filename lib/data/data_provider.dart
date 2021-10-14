import 'package:contact_list/data/person.dart';

class DataProvider {
  final _data = [
    Person(
      name: 'Sam',
      surname: 'Barnard',
      company: 'UC Berkeley',
      photo: 'images/sam_barnard.jpg',
    ),
    Person(
      name: 'Joel',
      surname: 'Cannon',
      company: 'Hooli Inc.',
      photo: 'images/joel_cannon.jpeg',
    ),
    Person(
      name: 'John',
      surname: 'Agnew',
      company: 'Standford University',
      photo: 'images/john_agnew.jpg',
    ),
    Person(
      name: 'Joshua',
      surname: 'Allison',
      company: 'Hooli Inc.',
      photo: 'images/joshua_allison.jpg',
    ),
    Person(
      name: 'Kyle',
      surname: 'Dickenson',
      company: 'Pied Piper',
      photo: 'images/kyle_dickenson.jpg',
    ),
    Person(
      name: 'Megan',
      surname: 'Blakely',
      company: 'Husky Energy',
      photo: 'images/megan_blakely.jpeg',
    ),
    Person(
      name: 'Lauren',
      surname: 'Davis',
      company: 'UC Berkeley',
    ),
    Person(
      name: 'John',
      surname: 'Ford',
      company: 'Hooli Inc.',
      photo: 'images/john_ford.jpg',
    ),
    Person(
      name: 'Matthew',
      surname: 'McCulloch',
      company: 'Pied Piper',
      photo: 'images/matthew_mcculloch.jpg',
    ),
    Person(
      name: 'Stan',
      surname: 'Morgan',
      company: 'Standford University',
    ),
  ];

  List<Person> getData() => _data..sort(_personComparator);

  int _personComparator(Person one, Person other) {
    final result = one.surname.compareTo(other.surname);
    return (result != 0) ? result : one.name.compareTo(other.name);
  }
}
