part of 'pages.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Menu'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/home_page');
          },
        ),
      ),
      backgroundColor: lightGreyColor,
      body: Column(
        children: [
          // BAGIAN ATAS
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gambar',
                  style: GoogleFonts.poppins(
                    color: CupertinoColors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Ubah',
                  style: GoogleFonts.poppins(
                    color: CupertinoColors.systemYellow,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // TAMBAH GAMBAR
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  height: 80,
                  width: 80,
                  child: Image(
                    image: AssetImage('assets/food_pic1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 50),
                Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  padding: EdgeInsets.all(40),
                  child: Text(
                    '+Tambah',
                    style: GoogleFonts.poppins(
                      color: CupertinoColors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
