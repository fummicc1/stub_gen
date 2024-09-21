import 'package:stub_gen/annotations.dart';
import 'package:stub_gen/stubbables.dart';
import 'package:test/test.dart';

part 'primitive_test.stub.dart';

@StubGen(defaultValues: {StubbableTypes.int: 1234})
class IntTarget {
  int value;
  IntTarget(this.value);
}

@StubGen(defaultValues: {StubbableTypes.string: "Hello World"})
class StringTarget {
  String value;
  StringTarget(this.value);
}

@StubGen()
class DoubleTarget {
  double value;
  DoubleTarget(this.value);
}

@StubGen()
class BoolTarget {
  bool value;
  BoolTarget(this.value);
}

@StubGen(defaultValues: {StubbableTypes.int: 123456})
class ListTarget {
  List<int> value;
  List<BoolTarget> boolTargets;
  ListTarget(this.value, this.boolTargets);
}

void main() {
  test("constructor with int", () {
    final target = IntTargetStubBuilder.build();
    expect(target.value, 1234);
  });
  test("constructor with String", () {
    final target = StringTargetStubBuilder.build();
    expect(target.value, "Hello World");
  });
  test("constructor with double", () {
    final target = DoubleTargetStubBuilder.build();
    expect(target.value, 1.0);
  });
  test("constructor with bool", () {
    final target = BoolTargetStubBuilder.build();
    expect(target.value, false);
  });

  test("constructor with List<int>", () {
    final target = ListTargetStubBuilder.build();
    expect(target.value, [123456]);
    expect(target.boolTargets.first.value, false);
  });
}
