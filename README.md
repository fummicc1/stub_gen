# stub_gen

`stub_gen` is a Dart package that generates stubs using the `build` package. This can facilitate writing unit tests for model logic.

## Features

- Creates a `.stub.dart` file where the stub method is written.
- Compatible with classes annotated with `freezed`.
- Allows insertion of arbitrary values into specific members via named parameters.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
stub_gen:
  git:
    url: https://github.com/fummicc1/stub_gen
    ref: 0.0.3
```

## Usage

1. Create a model class annotated with `StubGen`:

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

`StubGen` has a `defaultValues` parameter that allows you to modify the default values of `StubbableTypes`.

2. Run `build_runner` to generate the stub code:

```sh
dart run build_runner build
```

3. Write a unit test:

```dart
import 'package:example/sample.dart';
import 'package:test/test.dart';

void main() {
  test("Initial should be capitalized", () {
    final sample = SampleStub.stub(name: 'fummicc1');
    expect(sample.initial, "F");
  });
}
```
