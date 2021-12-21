import 'package:contact_list/data/data_provider.dart';
import 'package:contact_list/data/person.dart';
import 'package:contact_list/ui/contact_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contact_list_screen_test.mocks.dart';

@GenerateMocks([DataProvider])
void main() {
  final data = MockDataProvider();

  group('ContactListScreen test', () {
    testWidgets('ContactListScreen loads with empty list', (tester) async {
      when(data.getData()).thenReturn([]);

      await tester.pumpWidget(MaterialApp(home: ContactListScreen(data: data)));

      expect(find.byType(ContactListScreen), findsOneWidget);
      expect(find.byType(ListItemWidget), findsNothing);
    });

    testWidgets('ContactListScreen loads with non empty list', (tester) async {
      const itemCount = 3;

      when(data.getData()).thenReturn(List.generate(
        itemCount,
        (index) => Person(
          name: 'Name',
          surname: 'Surname',
          mobile: 990000000 + index,
          company: 'Company',
        ),
      ));

      await tester.pumpWidget(MaterialApp(home: ContactListScreen(data: data)));

      expect(find.byType(ListItemWidget), findsNWidgets(itemCount));
    });
  });
}
