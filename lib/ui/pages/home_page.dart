part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: Colors.white),
        SafeArea(
            child: Container(
          color: Colors.white,
        )),
        SafeArea(
            child: Center(
          child: Text("body area"),
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: NavbarButton(),
        ),
      ],
    ));
  }
}
