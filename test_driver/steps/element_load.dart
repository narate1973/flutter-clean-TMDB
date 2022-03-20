import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../utils/uilts.dart';

class ElementLoaded extends Then1WithWorld<String, FlutterWorld> {
  ElementLoaded()
      : super(
          StepDefinitionConfiguration()..timeout = const Duration(milliseconds: 2000),
        );

  @override
  Future<void> executeStep(String tag) async {
    await isAppeared(world.driver!, tag);
    await Future.delayed(const Duration(milliseconds: 750));
  }

  @override
  RegExp get pattern => RegExp(r'I should see {string} appeared');
}
