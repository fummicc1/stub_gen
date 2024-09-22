import 'package:stub_gen/stubbables.dart';

class StubGen {
  final Map<StubbableTypes, dynamic> defaultValues;

  const StubGen({
    this.defaultValues = const {},
  });
}

class EmailAddress {
  const EmailAddress();
}

class PhoneNumber {
  const PhoneNumber();
}
