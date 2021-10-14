import 'package:contact_list/data/data_provider.dart';
import 'package:contact_list/data/person.dart';
import 'package:contact_list/ui/contact_info_screen.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final contacts = DataProvider().getData();

  @override
  Widget build(BuildContext context) {
    if (contacts.isEmpty) {
      return const Center(child: Text('Contact list is empty'));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        itemBuilder: (context, index) => _itemGenerator().elementAt(index),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: _itemGenerator().length,
      ),
    );
  }

  Iterable<Widget> _itemGenerator() sync* {
    var sublistTitle = '';
    for (var contact in contacts) {
      if (contact.surname[0].toUpperCase() != sublistTitle) {
        sublistTitle = contact.surname[0].toUpperCase();
        yield SublistTitleWidget(title: sublistTitle);
      }
      yield ListItemWidget(contact: contact);
    }
  }
}

class SublistTitleWidget extends StatelessWidget {
  const SublistTitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({Key? key, required this.contact}) : super(key: key);

  final Person contact;

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  late Person contact;

  void _favoriteContactToggle() {
    setState(() => contact.isFavorite = !contact.isFavorite);
  }

  void _editContactInfo() async {
    final contact = await Navigator.of(context).push<Person>(MaterialPageRoute(
      builder: (context) => ContactInfoScreen(contact: this.contact),
    ));
    if (contact != null) setState(() => this.contact = contact);
  }

  @override
  void initState() {
    super.initState();
    contact = widget.contact;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: InkWell(
        onTap: _editContactInfo,
        child: Row(
          children: [
            IconButton(
              onPressed: _favoriteContactToggle,
              icon: contact.isFavorite
                  ? const Icon(Icons.star, color: Colors.lightBlueAccent)
                  : Icon(Icons.star_border, color: Colors.grey.withAlpha(140)),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 15),
            Hero(
              tag: contact,
              child: CircleAvatar(
                backgroundImage: (contact.photo != null)
                    ? AssetImage(contact.photo!)
                    : const AssetImage('images/placeholder.jpg'),
                radius: 25,
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${contact.name} ${contact.surname}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  contact.company,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
