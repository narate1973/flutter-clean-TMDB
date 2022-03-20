import 'package:flutter/material.dart';
import '../../../core/data_layer/app_api/app_api.dart';
import '../../../core/injection.dart' as di;
import '../../../features/home/presentation/view/page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Future<void> setUpApp() async {
    await di.init();
    AppApi.setUp(baseURL: 'https://api.themoviedb.org/3/');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage.create(),
    );
  }
}
