import 'package:contact_list/data/person.dart';

class DataProvider {
  final _data = [
    Person(
      name: 'Sam',
      surname: 'Barnard',
      mobile: 673251620,
      company: 'UC Berkeley',
      photo: 'images/sam_barnard.jpg',
    ),
    Person(
      name: 'Joel',
      surname: 'Cannon',
      mobile: 934221218,
      company: 'Hooli Inc.',
      photo: 'images/joel_cannon.jpeg',
    ),
    Person(
      name: 'John',
      surname: 'Agnew',
      mobile: 961817334,
      company: 'Standford University',
      photo: 'images/john_agnew.jpg',
    ),
    Person(
      name: 'Joshua',
      surname: 'Allison',
      mobile: 981751312,
      company: 'Hooli Inc.',
      photo: 'images/joshua_allison.jpg',
    ),
    Person(
      name: 'Kyle',
      surname: 'Dickenson',
      mobile: 633217941,
      company: 'Pied Piper',
      photo: 'images/kyle_dickenson.jpg',
    ),
    Person(
      name: 'Megan',
      surname: 'Blakely',
      mobile: 967291863,
      company: 'Husky Energy',
      photo: 'images/megan_blakely.jpeg',
    ),
    Person(
      name: 'Lauren',
      surname: 'Davis',
      mobile: 675429613,
      company: 'UC Berkeley',
    ),
    Person(
      name: 'John',
      surname: 'Ford',
      mobile: 936363775,
      company: 'Hooli Inc.',
      photo: 'images/john_ford.jpg',
    ),
    Person(
      name: 'Matthew',
      surname: 'McCulloch',
      mobile: 508891652,
      company: 'Pied Piper',
      photo: 'images/matthew_mcculloch.jpg',
    ),
    Person(
      name: 'Stan',
      surname: 'Morgan',
      mobile: 960501623,
      company: 'Standford University',
    ),
  ];

  List<Person> getData() => _data..sort(_personComparator);

  int _personComparator(Person one, Person other) {
    final result = one.surname.compareTo(other.surname);
    return (result != 0) ? result : one.name.compareTo(other.name);
  }
}
