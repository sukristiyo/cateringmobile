import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import 'ui/pages/pages.dart';

void main() {
  runApp(Ecatering());
}

class Ecatering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
        routes: <String, WidgetBuilder>{
          '/sign_in_page': (BuildContext context) => SignInPage(),
          '/sign_up_page': (BuildContext context) => SignUpPage(),
          '/address_page': (BuildContext context) => AddressPage(),
          '/forgot_page': (BuildContext context) => ForgotPassword(),
          '/home_page': (BuildContext context) => HomePage(),
        });
  }
}
