import 'package:example/sample.dart';
import 'package:test/test.dart';

void main() {
  test("Initial should be capitalized and email should be valid", () {
    final user = UserStubBuilder.build(name: 'fummicc1');
    expect(user.initial, "F");
    expect(user.isValidEmail, isTrue);
  });
}
