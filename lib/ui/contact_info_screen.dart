import 'package:contact_list/data/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({Key? key, required this.contact}) : super(key: key);

  final Person contact;

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  late Person contact;

  void _saveContact() => Navigator.of(context).pop(contact);

  @override
  void initState() {
    super.initState();
    contact = widget.contact.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _saveContact,
            child: const Text(
              'Save',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: const [
              AvatarWidget(),
              SizedBox(height: 20),
              NameTextFieldWidget(),
              SizedBox(height: 15),
              SurnameTextFieldWidget(),
              SizedBox(height: 15),
              MobileTextFieldWidget(),
              SizedBox(height: 15),
              CompanyTextFieldWidget(),
              SizedBox(height: 15),
              BioTextFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Person contact =
        context.findAncestorWidgetOfExactType<ContactInfoScreen>()!.contact;

    return Center(
      child: Hero(
        tag: contact,
        child: CircleAvatar(
          backgroundImage: (contact.photo != null)
              ? AssetImage(contact.photo!)
              : const AssetImage('images/placeholder.jpg'),
          radius: 70,
        ),
      ),
    );
  }
}

class NameTextFieldWidget extends StatefulWidget {
  const NameTextFieldWidget({Key? key}) : super(key: key);

  @override
  _NameTextFieldWidgetState createState() => _NameTextFieldWidgetState();
}

class _NameTextFieldWidgetState extends State<NameTextFieldWidget> {
  final controller = TextEditingController();
  late Person contact;

  @override
  void initState() {
    super.initState();
    contact =
        context.findAncestorStateOfType<_ContactInfoScreenState>()!.contact;
    controller.text = contact.name;
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onChanged: (text) => context
            .findAncestorStateOfType<_ContactInfoScreenState>()!
            .contact = contact.copyWith(name: text),
        decoration: const InputDecoration(labelText: 'Name'),
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.words,
        inputFormatters: [
          LengthLimitingTextInputFormatter(70),
        ],
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SurnameTextFieldWidget extends StatefulWidget {
  const SurnameTextFieldWidget({Key? key}) : super(key: key);

  @override
  _SurnameTextFieldWidgetState createState() => _SurnameTextFieldWidgetState();
}

class _SurnameTextFieldWidgetState extends State<SurnameTextFieldWidget> {
  final controller = TextEditingController();
  late final Person contact;

  @override
  void initState() {
    super.initState();
    contact =
        context.findAncestorStateOfType<_ContactInfoScreenState>()!.contact;
    controller.text = contact.surname;
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onChanged: (text) => context
            .findAncestorStateOfType<_ContactInfoScreenState>()!
            .contact = contact.copyWith(surname: text),
        decoration: const InputDecoration(labelText: 'Surname'),
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.words,
        inputFormatters: [
          LengthLimitingTextInputFormatter(70),
        ],
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MobileTextFieldWidget extends StatefulWidget {
  const MobileTextFieldWidget({Key? key}) : super(key: key);

  @override
  _MobileTextFieldWidgetState createState() => _MobileTextFieldWidgetState();
}

class _MobileTextFieldWidgetState extends State<MobileTextFieldWidget> {
  final controller = TextEditingController();
  late final Person contact;

  @override
  void initState() {
    super.initState();
    contact =
        context.findAncestorStateOfType<_ContactInfoScreenState>()!.contact;
    controller.text = contact.mobile.toString();
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onChanged: (text) => context
            .findAncestorStateOfType<_ContactInfoScreenState>()!
            .contact = contact.copyWith(mobile: int.tryParse(text) ?? 0),
        decoration: const InputDecoration(
          labelText: 'Mobile',
          prefixText: '+380',
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.deny(RegExp(r'^0')),
          LengthLimitingTextInputFormatter(9),
        ],
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class CompanyTextFieldWidget extends StatefulWidget {
  const CompanyTextFieldWidget({Key? key}) : super(key: key);

  @override
  _CompanyTextFieldWidgetState createState() => _CompanyTextFieldWidgetState();
}

class _CompanyTextFieldWidgetState extends State<CompanyTextFieldWidget> {
  final controller = TextEditingController();
  late final Person contact;

  @override
  void initState() {
    super.initState();
    contact =
        context.findAncestorStateOfType<_ContactInfoScreenState>()!.contact;
    controller.text = contact.company;
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onChanged: (text) => context
            .findAncestorStateOfType<_ContactInfoScreenState>()!
            .contact = contact.copyWith(company: text),
        decoration: const InputDecoration(labelText: 'Company'),
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.words,
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class BioTextFieldWidget extends StatefulWidget {
  const BioTextFieldWidget({Key? key}) : super(key: key);

  @override
  _BioTextFieldWidgetState createState() => _BioTextFieldWidgetState();
}

class _BioTextFieldWidgetState extends State<BioTextFieldWidget> {
  final controller = TextEditingController();
  late final Person contact;

  @override
  void initState() {
    super.initState();
    contact =
        context.findAncestorStateOfType<_ContactInfoScreenState>()!.contact;
    controller.text = contact.bio ?? '';
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onChanged: (text) => context
            .findAncestorStateOfType<_ContactInfoScreenState>()!
            .contact = contact.copyWith(bio: text.isEmpty ? null : text),
        decoration: const InputDecoration(labelText: 'Bio'),
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        minLines: 3,
        maxLines: null,
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
