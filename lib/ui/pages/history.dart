part of 'pages.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
          'History',
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
            children: <Widget>[
              // Pemesanan Card
              // Parameter: No.Pemesanan, Status, DateTime
              buildContainerPemesanan(
                  '#001A', 'Menunggu Konfirmasi', '11-12-2020 16:30'),
              buildContainerPemesanan('#002A', 'Terkirim', '17-12-2020 12:30'),
              // Tombol Hubungi Penjual
              buildHubungiPenjualButton(),
            ],
          ),
        ),
      ),
    );
  }

  Align buildHubungiPenjualButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(20),
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          minWidth: 200,
          color: backGroundColor,
          onPressed: () {
            Navigator.pushNamed(context, '/HomeScreenPage'); // CONTACT
          },
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            'Hubungi Penjual',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainerPemesanan(
      String pemesanan, String status, String dateTime) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: lightGreyColor,
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pemesanan ' + pemesanan,
              style: GoogleFonts.poppins(
                color: CupertinoColors.black,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 15),
                height: 80,
                width: 80,
                child: Image(
                  image: AssetImage('assets/food_delivert.png'),
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    status,
                    style: GoogleFonts.poppins(
                      color: CupertinoColors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    dateTime,
                    style: GoogleFonts.poppins(
                      color: CupertinoColors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
