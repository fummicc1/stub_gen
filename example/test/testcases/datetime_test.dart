import 'package:stub_gen/annotations.dart';
import 'package:stub_gen/stubbables.dart';
import 'package:test/test.dart';

part 'datetime_test.stub.dart';

@StubGen(defaultValues: {StubbableTypes.dateTime: '2022-01-01T00:00:00Z'})
class DateTimeObject {
  final DateTime dateTime;

  const DateTimeObject({required this.dateTime});
}

@StubGen(defaultValues: {StubbableTypes.dateTime: '2024-01-01T10:00:00Z'})
class NullableDateTimeObject {
  final DateTime? dateTime;

  const NullableDateTimeObject({required this.dateTime});
}

void main() {
  group('DateTime stub', () {
    test('succeed to make a stub', () {
      final stub = DateTimeObjectStubBuilder.build();
      expect(stub.dateTime, DateTime.parse('2022-01-01T00:00:00Z'));
    });
  });

  group('Nullable DateTime stub', () {
    test('succeed to make a stub', () {
      final stub = NullableDateTimeObjectStubBuilder.build();
      expect(stub.dateTime, DateTime.parse('2024-01-01T10:00:00Z'));
    });
  });
}
