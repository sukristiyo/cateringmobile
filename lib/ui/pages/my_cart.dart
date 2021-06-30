part of 'pages.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
          'Keranjang Saya',
          style: GoogleFonts.poppins(
            color: CupertinoColors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: lightGreyColor,
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              // List Qty Makanan
              // Parameternya:
              buildContainerFoodQty('Ayam Sambal', 'assets/food_pic1.png'),
              // buildContainerFoodQty('Steak Beef', 'assets/food_pic2.png'),
              // buildContainerFoodQty('Es Buah', 'assets/food_pic3.png'),
              // buildContainerFoodQty('Bubur Bumli', 'assets/food_pic4.png'),
              // buildContainerFoodQty('Ayam Bali', 'assets/food_pic5.png'),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            border: Border.all(
                                width: 2, color: CupertinoColors.systemYellow),
                          ),
                        ),
                        Text(
                          'Pilih Semua',
                          style: GoogleFonts.poppins(
                            color: CupertinoColors.black,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 160,
                      child: RaisedButton(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        // width: 170,
                        color: mainColor,
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          'Order Now',
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
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerFoodQty(String foodName, String picture) {
    return Container(
        // MASIH ADA SALAH DI BAGIAN CHECKBOX, DAN TAMBAH DAN KURANG MASIH BELUM JALAN
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        color: CupertinoColors.white,
        child: Row(
          children: <Widget>[
            // CHECKLIST FIELD
            Stack(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(
                        width: 2, color: CupertinoColors.systemYellow),
                  ),
                ),
                Center(
                  child: Icon(Icons.check),
                ),
              ],
            ),
            // FOOD PICTURE
            Container(
              margin: EdgeInsets.only(right: 30),
              height: 80,
              width: 80,
              child: Image(
                image: AssetImage(picture),
                fit: BoxFit.cover,
              ),
            ),
            // Nama Makanan dan Jumlah
            Column(
              children: <Widget>[
                Text(
                  foodName,
                  style: GoogleFonts.poppins(
                    color: CupertinoColors.black,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      child: IconButton(
                        icon: Icon(Icons.remove_circle_outline, size: 30),
                        onPressed: () {
                          print('remove button pressed');
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      child: Text(
                        '14',
                        style: GoogleFonts.poppins(
                          color: CupertinoColors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      child: IconButton(
                        icon: Icon(Icons.add_circle_outline, size: 30),
                        onPressed: () {
                          print('add button pressed');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
