import 'package:flutter_driver/src/driver/driver.dart';

Future<void> isAppeared(FlutterDriver driver, dynamic tag, [bool appeared = true]) async {
  final finder = createFinderByTag(tag);
  if (appeared) {
    await driver.waitFor(finder);
  } else {
    await driver.waitForAbsent(finder);
  }
}

createFinderByTag(dynamic tag) {
  assert(tag != null);
  dynamic finder;
  if (tag is String) {
    finder = find.byValueKey(tag);
  } else if (tag is List<String>) {
    assert(tag.isNotEmpty);
    finder = find.byValueKey(tag[0]);
    for (var i = 1; i < tag.length; i++) {
      finder = finder.childByTag(tag[i]);
    }
  } else {
    throw UnsupportedError(
        'Tag parameter must be `String` or `List<String>` which currently is `${tag.runtimeType}`');
  }
  return finder;
}
