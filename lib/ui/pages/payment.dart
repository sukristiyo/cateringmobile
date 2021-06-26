part of 'pages.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CupertinoColors.systemYellow,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: CupertinoColors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/HomeScreenPage');
            },
          ),
          title: Text(
            'Payment',
            style: GoogleFonts.poppins(
              color: CupertinoColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // DETAIL TAGIHAN
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightGreyColor,
                  ),
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp. 1.289.000',
                        style: GoogleFonts.poppins(
                          color: CupertinoColors.black,
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Detail Tagihan',
                        style: GoogleFonts.poppins(
                          color: CupertinoColors.black,
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // BANK TRANSFER
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightGreyColor,
                  ),
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Bank Transfer',
                          style: GoogleFonts.poppins(
                            color: CupertinoColors.black,
                            fontSize: 18,
                            // fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Pembayaran akan dilakukan melalui rekening bank, nomor rekening tujuan akan dikirim melalui email.',
                        style: GoogleFonts.poppins(
                          color: CupertinoColors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minWidth: 170,
                        color: backGroundColor,
                        onPressed: () {
                          Navigator.pushNamed(context, '/HomeScreenPage');
                        },
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          'Bayar Sekarang',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // CATPAY
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightGreyColor,
                  ),
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Catpay',
                        style: GoogleFonts.poppins(
                          color: CupertinoColors.black,
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print('catpay pressed');
                        },
                        icon: Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                ),
                // COD / Bayar ditempat
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightGreyColor,
                  ),
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'COD / Bayar ditempat',
                        style: GoogleFonts.poppins(
                          color: CupertinoColors.black,
                          fontSize: 18,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print('COD pressed');
                        },
                        icon: Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 75),
                // DONE BUTTON
                Container(
                  width: 300,
                  child: RaisedButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    // width: 170,
                    color: mainColor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/HomeScreenPage');
                    },
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(
                      'Done',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
