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
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/splash_screen': (BuildContext context) => SplashScreen(),
          '/sign_in_page': (BuildContext context) => SignInPage(),
          '/sign_up_page': (BuildContext context) => SignUpPage(),
          '/address_page': (BuildContext context) => AddressPage(),
          '/forgot_page': (BuildContext context) => ForgotPassword(),
          '/forgotpasswordverification': (BuildContext context) =>
              ForgotPasswordVerificationScreen(),
          '/home_page': (BuildContext context) => HomePage(),
          '/resetpassword': (BuildContext context) => ResetPasswordScreen(),
          '/change_password': (BuildContext context) => ResetPassword(),
          '/order_history_page': (BuildContext context) => OrderHistoryPage(),
        });
  }
}
