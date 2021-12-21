// Mocks generated by Mockito 5.0.17 from annotations
// in contact_list/test/contact_list_screen_test.dart.
// Do not manually edit this file.

import 'package:contact_list/data/data_provider.dart' as _i2;
import 'package:contact_list/data/person.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [DataProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataProvider extends _i1.Mock implements _i2.DataProvider {
  MockDataProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.Person> getData() =>
      (super.noSuchMethod(Invocation.method(#getData, []),
          returnValue: <_i3.Person>[]) as List<_i3.Person>);
}