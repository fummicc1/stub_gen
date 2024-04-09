import 'package:stub_gen/annotations.dart';
import 'package:test/test.dart';

part 'named_nullable_parameter_test.stub.dart';

@StubGen()
class CustomClass {
  final String? name;

  const CustomClass({required this.name});
}

@StubGen()
class MainClass {
  final CustomClass? customClass;

  const MainClass({required this.customClass});
}

void main() {
  group('NamedNullableParameterClass', () {
    test('succeed to make a stub', () {
      final stub = MainClass.stub(customClass: null);
      expect(stub.customClass?.name, equals('stub'));
    });
  });
}
