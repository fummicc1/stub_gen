import 'package:stub_kit/annotations.dart';
import 'package:stub_kit/stubbables.dart';

part 'sample.g.dart';

@Stub(defaultValues: {StubbableTypes.int: 10})
class Sample {
  final String name;
  final int age;
  final double height;
  final bool isMale;

  const Sample(
    this.name,
    this.age,
    this.height,
    this.isMale,
  );
}
