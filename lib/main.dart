import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compile Anywhere',
      initialRoute: '/intro',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
