import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

part 'enum_test.stub.dart';

@StubGen()
enum Color { red, green, blue }

void main() {
  group('stub simple enum', () {
    test('succeed to make a stub', () {
      expect(ColorStubBuilder.build(), Color.red);
    });
  });
}
