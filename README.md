# stub_gen

`stub_gen` is a Dart package that generates stubs using the `build` package. This can facilitate writing unit tests for model logic.

## Features

- Creates a `.stub.dart` file where the stub method is written.
- Compatible with classes annotated with `freezed`.
- Allows insertion of arbitrary values into specific members via named parameters.
- Supports faker annotations by [`faker`](https://pub.dev/packages/faker) package.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
stub_gen:
  git:
    url: https://github.com/fummicc1/stub_gen
    ref: 0.0.5
```

## Usage

1. Create a model class annotated with `StubGen`:

```dart
// sample.dart
part 'sample.stub.dart';

@StubGen()
class User {
  final String name;
  final int age;
  final double height;
  final String email;

  const User(
    this.name,
    this.age,
    this.height,
    @EmailAddress()
    this.email,
  );

  String get initial {
    return name[0].toUpperCase();
  }

  bool get isValidEmail {
    return email.contains("@");
  }
}
```

- `StubGen` has a `defaultValues` parameter that allows you to modify the default values of `StubbableTypes`.
- There are some annotations for faker such as `@EmailAddress` and `@PhoneNumber`.

2. Run `build_runner` to generate the stub code:

```sh
dart run build_runner build
```

this command generates `sample.stub.dart` file like below.

```dart
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'sample.dart';

// **************************************************************************
// StubGenerator
// **************************************************************************

extension UserStubBuilder on User {
  static User build(
          {String name = "stub",
          int age = 10,
          double height = 1.0,
          String email = "beahan-madie@sauer.co.uk"}) =>
      User(name ?? "stub", age ?? 10, height ?? 1.0, email ?? "stub");
}
```

3. Write a unit test:

```dart
import 'package:example/sample.dart';
import 'package:test/test.dart';

void main() {
  test("Initial should be capitalized and email should be valid", () {
    final user = UserStubBuilder.build(name: 'fummicc1');
    expect(user.initial, "F");
    expect(user.isValidEmail, isTrue);
  });
}
```
