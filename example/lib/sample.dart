import 'package:stub_gen/annotations.dart';
import 'package:stub_gen/stubbables.dart';

part 'sample.stub.dart';

@StubGen(defaultValues: {StubbableTypes.int: 10})
class User {
  final String name;
  final int age;
  final double height;
  final String email;

  const User(
    this.name,
    this.age,
    this.height,
    @EmailAddress() this.email,
  );

  String get initial {
    return name[0].toUpperCase();
  }

  bool get isValidEmail {
    return email.contains("@");
  }
}
