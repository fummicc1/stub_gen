import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

part 'faker_test.stub.dart';

@StubGen()
class FakeModel {
  final String? email;

  final String phoneNumber;

  final String name;

  const FakeModel({
    @EmailAddress() required this.email,
    @PhoneNumber() required this.phoneNumber,
    required this.name,
  });
}

void main() {
  test("faker annotation", () {
    final target = FakeModelStubBuilder.build();
    expect(target.email, isA<String>());
    expect(target.phoneNumber, isA<String>());
  });
}
