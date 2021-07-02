part of 'pages.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: CupertinoColors.systemYellow,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/food_pic1.png'),
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: CupertinoColors.black, size: 30),
              onPressed: () {
                Navigator.pushNamed(context, '/home_page');
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: 400,
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //baris pertama
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ayam Sambal Kemangi',
                            style: GoogleFonts.poppins(
                              color: CupertinoColors.black,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              StarWidget(),
                              StarWidget(),
                              StarWidget(),
                              StarWidget(),
                              StarWidget(),
                              Text(
                                '4.5',
                                style: GoogleFonts.poppins(
                                  color: greyColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // TOMBOL TAMBAH DAN KURANG PESANAN
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            child: IconButton(
                              icon: Icon(Icons.remove_circle_outline, size: 30),
                              onPressed: () {
                                setState(() {
                                  if (counter > 0) {
                                    counter--;
                                  }
                                });
                                print('remove button pressed');
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              counter.toString(),
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
                                setState(() {
                                  counter++;
                                });
                                print('add button pressed');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Baris Kedua = DESKRIPSI LENGKAP TENTANG MAKANAN YANG DIPESAN
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur',
                      style: GoogleFonts.poppins(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  // Baris Ketiga = Ingredient
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Inggredients',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  // Baris keEmpat = Total Price
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(
                      'Seledri, telur, blueberry, madu',
                      style: GoogleFonts.poppins(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: GoogleFonts.poppins(
                              color: greyColor,
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'IDR 1.289.900',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      // Tombol Order Now
                      Container(
                        width: 160,
                        child: RaisedButton(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          // width: 170,
                          color: mainColor,
                          onPressed: () {
                            Navigator.pushNamed(context, '/my_cart');
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  const StarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Icon(Icons.star, color: mainColor, size: 16),
    );
  }
}
