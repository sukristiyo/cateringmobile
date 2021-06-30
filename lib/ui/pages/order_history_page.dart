part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CupertinoColors.activeBlue,
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/description_page');
                      },
                      child: Text(
                        'Description Page',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                    //
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/payment');
                      },
                      child: Text(
                        'Payment',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      child: Text(
                        'Check Out',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/history');
                      },
                      child: Text(
                        'History',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/my_cart');
                      },
                      child: Text(
                        'My Cart',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )

              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('assets/food_pic1.png'))),
              ),
        ]),
      ),
    );
  }
}
