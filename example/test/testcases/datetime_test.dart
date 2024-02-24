import 'package:stub_kit/annotations.dart';
import 'package:stub_kit/stubbables.dart';
import 'package:test/test.dart';

part 'datetime_test.g.dart';

@Stub(defaultValues: {StubbableTypes.dateTime: '2022-01-01T00:00:00Z'})
class DateTimeObject {
  final DateTime dateTime;

  const DateTimeObject({required this.dateTime});
}

@Stub(defaultValues: {StubbableTypes.dateTime: '2024-01-01T00:00:00Z'})
class NullableDateTimeObject {
  final DateTime? dateTime;

  const NullableDateTimeObject({required this.dateTime});
}

void main() {
  group('DateTime stub', () {
    test('succeed to make a stub', () {
      final stub = DateTimeObjectStub.stub();
      expect(stub.dateTime, DateTime.parse('2022-01-01T00:00:00Z'));
    });
  });

  group('Nullable DateTime stub', () {
    test('succeed to make a stub', () {
      final stub = NullableDateTimeObjectStub.stub();
      expect(stub.dateTime, DateTime.parse('2024-01-01T00:00:00Z'));
    });
  });
}
