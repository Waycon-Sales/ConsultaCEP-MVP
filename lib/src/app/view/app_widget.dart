import 'package:estudo_soap_flutter/src/app/view/address.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
//import 'initial_splash.dart';

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
        //'/HomePage': (context) => HomePage(),
        Address.routeNane: (context) => Address(),
      },
    );
  }
}

/*Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFED213A),
              Color(0xFF93291E),
            ]),
        navigateAfterSeconds: HomePage(),
        loaderColor: Colors.black,
      ),
    ],
  );
}*/

 