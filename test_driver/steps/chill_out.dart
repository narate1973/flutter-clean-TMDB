import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric chillOut() {
  return then<FlutterWorld>('I chill out for a bit', (context) async {
    await Future.delayed(const Duration(milliseconds: 2000));
  });
}
