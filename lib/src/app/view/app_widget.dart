import 'package:estudo_soap_flutter/src/app/view/address.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        Address.routeNane: (context) => Address(),
      },
    );
  }
}
