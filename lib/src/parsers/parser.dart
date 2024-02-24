import 'package:stub_kit/src/default_values.dart';

mixin Parser {
  String parse({required DefaultValues defaultValues});
  String parseForArgument({required DefaultValues defaultValues}) {
    return "";
  }
}
