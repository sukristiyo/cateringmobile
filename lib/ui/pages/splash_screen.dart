part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/sign_in_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_screen_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash_screen_circle.png'),
            ),
          ),
          child: Center(
            child: Image(
              image: AssetImage('assets/splash_screen_logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
