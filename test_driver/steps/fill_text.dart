import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric fillTextField() {
  return then2<String, String, FlutterWorld>(
    'I fill {string} with {string}',
    (key, value, context) async {
      final finder = find.byValueKey(key);
      await context.world.driver!.tap(finder);
      await Future.delayed(const Duration(milliseconds: 250));
      await context.world.driver!.enterText(value);
      await Future.delayed(const Duration(milliseconds: 250));
    },
  );
}
