part of 'pages.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  bool ayamSambalChecked = false;
  bool steakBeefChecked = false;
  bool esBuahChecked = false;
  bool buburBumliChecked = false;
  bool ayamBaliChecked = false;
  bool allClicked = false;

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
              // buildContainerFoodQty(
              //     'Ayam Sambal', 'assets/food_pic1.png', ayamSambalChecked),
              // buildContainerFoodQty(
              //     'Steak Beef', 'assets/food_pic2.png', steakBeefChecked),
              // buildContainerFoodQty(
              //     'Es Buah', 'assets/food_pic3.png', esBuahChecked),
              // buildContainerFoodQty(
              //     'Bubur Bumli', 'assets/food_pic4.png', buburBumliChecked),
              // buildContainerFoodQty(
              //     'Ayam Bali', 'assets/food_pic5.png', ayamBaliChecked),
              Container(
                // MASIH ADA SALAH DI BAGIAN CHECKBOX, DAN TAMBAH DAN KURANG MASIH BELUM JALAN
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                color: CupertinoColors.white,
                child: Row(
                  children: <Widget>[
                    // CHECKBOX
                    Checkbox(
                      value: ayamSambalChecked,
                      onChanged: (newAyamSambalChecked) {
                        setState(
                          () {
                            ayamSambalChecked = !ayamSambalChecked;
                            print('ayam sambal = $ayamSambalChecked');
                          },
                        );
                      },
                    ),
                    // FOOD PICTURE
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      height: 80,
                      width: 80,
                      child: Image(
                        image: AssetImage('assets/food_pic1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Nama Makanan dan Jumlah
                    Column(
                      children: <Widget>[
                        Text(
                          'Ayam Sambal',
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
                                icon:
                                    Icon(Icons.remove_circle_outline, size: 30),
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
                ),
              ),
              Container(
                // MASIH ADA SALAH DI BAGIAN CHECKBOX, DAN TAMBAH DAN KURANG MASIH BELUM JALAN
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                color: CupertinoColors.white,
                child: Row(
                  children: <Widget>[
                    // CHECKBOX
                    Checkbox(
                      value: steakBeefChecked,
                      onChanged: (newSteakBeefChecked) {
                        setState(
                          () {
                            steakBeefChecked = !steakBeefChecked;
                            print('Steak Beef = $steakBeefChecked');
                          },
                        );
                      },
                    ),
                    // FOOD PICTURE
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      height: 80,
                      width: 80,
                      child: Image(
                        image: AssetImage('assets/food_pic2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Nama Makanan dan Jumlah
                    Column(
                      children: <Widget>[
                        Text(
                          'Steak Beef',
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
                                icon:
                                    Icon(Icons.remove_circle_outline, size: 30),
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
                ),
              ),
              Container(
                // MASIH ADA SALAH DI BAGIAN CHECKBOX, DAN TAMBAH DAN KURANG MASIH BELUM JALAN
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                color: CupertinoColors.white,
                child: Row(
                  children: <Widget>[
                    // CHECKBOX
                    Checkbox(
                      value: esBuahChecked,
                      onChanged: (newEsBuahChecked) {
                        setState(
                          () {
                            esBuahChecked = !esBuahChecked;
                            print('Es Buah = $esBuahChecked');
                          },
                        );
                      },
                    ),
                    // FOOD PICTURE
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      height: 80,
                      width: 80,
                      child: Image(
                        image: AssetImage('assets/food_pic3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Nama Makanan dan Jumlah
                    Column(
                      children: <Widget>[
                        Text(
                          'Es Buah',
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
                                icon:
                                    Icon(Icons.remove_circle_outline, size: 30),
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
                ),
              ),
              Container(
                // MASIH ADA SALAH DI BAGIAN CHECKBOX, DAN TAMBAH DAN KURANG MASIH BELUM JALAN
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                color: CupertinoColors.white,
                child: Row(
                  children: <Widget>[
                    // CHECKBOX
                    Checkbox(
                      value: buburBumliChecked,
                      onChanged: (newBuburBumliChecked) {
                        setState(
                          () {
                            buburBumliChecked = !buburBumliChecked;
                            print('Bubur Bumli = $buburBumliChecked');
                          },
                        );
                      },
                    ),
                    // FOOD PICTURE
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      height: 80,
                      width: 80,
                      child: Image(
                        image: AssetImage('assets/food_pic4.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Nama Makanan dan Jumlah
                    Column(
                      children: <Widget>[
                        Text(
                          'Bubur Bumli',
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
                                icon:
                                    Icon(Icons.remove_circle_outline, size: 30),
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
                ),
              ),
              Container(
                // MASIH ADA SALAH DI BAGIAN CHECKBOX, DAN TAMBAH DAN KURANG MASIH BELUM JALAN
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                color: CupertinoColors.white,
                child: Row(
                  children: <Widget>[
                    // CHECKBOX
                    Checkbox(
                      value: ayamBaliChecked,
                      onChanged: (newAyamBaliChecked) {
                        setState(
                          () {
                            ayamBaliChecked = !ayamBaliChecked;
                            print('Ayam Bali = $ayamBaliChecked');
                          },
                        );
                      },
                    ),
                    // FOOD PICTURE
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      height: 80,
                      width: 80,
                      child: Image(
                        image: AssetImage('assets/food_pic5.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Nama Makanan dan Jumlah
                    Column(
                      children: <Widget>[
                        Text(
                          'Ayam Bali',
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
                                icon:
                                    Icon(Icons.remove_circle_outline, size: 30),
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
                ),
              ),
              Row(
                children: [
                  Text('belajar CheckBox'),
                  IconButton(
                    icon: Icon(Icons.check_box),
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkbox_tutorial');
                    },
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/add_menu');
                },
                leading: Icon(Icons.menu_book),
                title: Text('Tambah menu'),
              ),
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
                        Checkbox(
                          value: allClicked,
                          onChanged: (newAllClicked) {
                            setState(
                              () {
                                allClicked = !allClicked;
                                ayamSambalChecked = allClicked;
                                steakBeefChecked = allClicked;
                                esBuahChecked = allClicked;
                                buburBumliChecked = allClicked;
                                ayamBaliChecked = allClicked;

                                print('Allclicked = $allClicked');

                                if (ayamSambalChecked == true &&
                                    steakBeefChecked == true &&
                                    esBuahChecked == true &&
                                    buburBumliChecked == true &&
                                    ayamBaliChecked == true) {
                                  allClicked = true;
                                } else {
                                  allClicked = false;
                                }
                              },
                            );
                          },
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

  Container buildContainerFoodQty(
      String foodName, String picture, bool isChecked) {
    return Container(
      // MASIH ADA SALAH DI BAGIAN CHECKBOX, DAN TAMBAH DAN KURANG MASIH BELUM JALAN
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      color: CupertinoColors.white,
      child: Row(
        children: <Widget>[
          // CHECKBOX
          Checkbox(
            value: isChecked,
            onChanged: (newNilai) {
              setState(
                () {
                  isChecked = !isChecked;
                  print('Nilai = $isChecked');
                  print(isChecked);
                },
              );
            },
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
      ),
    );
  }
}
