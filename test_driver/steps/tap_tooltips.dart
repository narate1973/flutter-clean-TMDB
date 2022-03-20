import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric tapByToolTips() {
  return when1<String, FlutterWorld>(
    'I select {string} tab',
    (key, context) async {
      final finder = find.byTooltip(key);
      await context.world.driver!.tap(finder);
      await Future.delayed(const Duration(milliseconds: 500));
    },
  );
}
