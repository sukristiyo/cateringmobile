part of 'pages.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.systemYellow,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: CupertinoColors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/home_page');
          },
        ),
        title: Text(
          'Check Out',
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
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Item Ordered',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      height: 70,
                      width: 70,
                      child: Image(
                        image: AssetImage('assets/food_pic1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ayam Sambal',
                          style: GoogleFonts.poppins(
                            color: CupertinoColors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'IDR 289.000',
                          style: GoogleFonts.poppins(
                            color: greyColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 75),
                    Text(
                      '14 Items',
                      style: GoogleFonts.poppins(
                        color: greyColor,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              // DETAIL TRANSACTION
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Detail Transaction',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cherry Healthy',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          'IDR 1.289.000',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Driver',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          'IDR 19.000',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          'IDR 19.000',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          'IDR 1.289.000',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // DELIVER TO
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Deliver To',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          'Sukristyo',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Phone Number',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          '08123456789',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Address',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          'Perum. Villa Alam Asri',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'House No.',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          'EB-05',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'City.',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          'Batam',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 75),
              // FLAT BUTTON
              Container(
                margin: EdgeInsets.all(20),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minWidth: double.infinity,
                  color: backGroundColor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/HomeScreenPage');
                  },
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Container(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.account_balance_wallet, color: Colors.white),
                        Text(
                          'List Voucher',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: mainColor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment');
                  },
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    'Checkout Now',
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
      ),
    );
  }
}
