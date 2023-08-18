import 'package:flutter/material.dart';

import 'injection.dart';
import 'contact_view.dart';

void main() => runApp(MyApp(Flavor.MOCK));

@immutable
class MyApp extends StatelessWidget {
  final Flavor _flavor;

  MyApp(this._flavor, {super.key}) {
    Injector.configure(_flavor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter MVP Demo",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const ContactPage(),
    );
  }
}
