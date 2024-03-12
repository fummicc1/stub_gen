import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

part 'enum_test.g.dart';

@Stub()
enum Color { red, green, blue }

void main() {
  group('stub simple enum', () {
    test('succeed to make a stub', () {
      expect(ColorStub.stub(), Color.red);
    });
  });
}
