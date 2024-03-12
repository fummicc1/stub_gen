# stub_gen

`stub_gen` is a dart package that generates stub of any class by using `build`.
This can facilitate you to write a unit test for a model logic.

## Features

- Create `.stub.dart` file where stub method is written.
- Available with `freezed` annotation class.
- Custom specific member with arbitrary value via named parameter.

## Installation

add the following to `pubspec.yaml`

```yaml
stub_gen:
  git:
    url: https://github.com/fummicc1/stub_gen
    ref: 0.0.2
```

## Usage

1. Create model class annotated with `StubGen`

```dart
// sample.dart
part 'sample.stub.dart';

@StubGen()
class Sample {
  final String name;
  final int age;
  final double height;

  const Sample(
    this.name,
    this.age,
    this.height,
  );

  String get initial {
    return name[0].toUpperCase();
  }
}
```

StubGen has `defaultValues` parameter so that you can modify default value of `StubbableTypes`.

2. Run build_runner to generate stub codes.

```sh
dart run build_runner build
```

3. Write a unit test

```dart
import 'package:example/sample.dart';
import 'package:test/test.dart';

void main() {
  test("make_sample_stub", () {
    final sample = SampleStub.stub(name: 'fummicc1');
    expect(sample.initial, "F");
  });
}

```
