part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  static String tag = 'UserLogin';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  // static String kota;
  static String role = "user";

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Success"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Your Account is successfully Registered!"),
                Text("Enjoy Our Service!"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pushNamed(context, '/sign_in_page');
              },
            ),
          ],
        );
      },
    );
  }

  void validation() {
    UserLoginModel userLoginModel = new UserLoginModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        address: addressController.text,
        houseNumber: houseController.text,
        phoneNumber: phoneController.text,
        city: cityController.text,
        roles: role);

    var requestBody = jsonEncode(userLoginModel.toJson());
    print(requestBody);
    UserLoginServices.insertData(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        _showMyDialog();
      } else {}
    }).catchError((error) {
      //String err = error.toString();
    });
    print(requestBody);
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign Up',
      subtitle: "Registrasi",
      onBackButtonPressed: () {
        Navigator.pushNamed(context, '/sign_in_page');
      },
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(top: 26),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/photo_border.png'))),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         image: DecorationImage(
            //             image: NetworkImage(
            //                 'https://www.facebook.com/789278027898220/photos/a.821656274660395/821656277993728/'),
            //             fit: BoxFit.cover)),
            //   ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Full Name",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mainColor)),
            child: TextField(
              controller: nameController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFontStyle3,
                  hintText: 'Type your Full Name'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Email Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mainColor)),
            child: TextField(
              controller: emailController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFontStyle3,
                  hintText: 'Type your email address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mainColor)),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFontStyle3,
                  hintText: 'Type your password'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Phone No.",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mainColor)),
            child: TextField(
              controller: phoneController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFontStyle3,
                  hintText: 'Type your phone number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mainColor)),
            child: TextField(
              controller: addressController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFontStyle3,
                  hintText: 'Type your address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "House No.",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mainColor)),
            child: TextField(
              controller: houseController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFontStyle3,
                  hintText: 'Type your House Number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "City",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: mainColor)),
            child: TextField(
              controller: cityController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: blackFontStyle3,
                  hintText: 'Type your city'),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
          //   child: Text(
          //     "City",
          //     style: blackFontStyle2,
          //   ),
          // ),
          // Container(
          //   width: double.infinity,
          //   margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       border: Border.all(color: "FFC700".toColor())),
          //   child: DropdownButton(
          //       // focusColor: Colors.blue,
          //       isExpanded: true,
          //       underline: SizedBox(),
          //       items: [
          //         DropdownMenuItem(
          //             child: Text(
          //           'Batam',
          //           style: blackFontStyle3,
          //         )),
          //         DropdownMenuItem(
          //             child: Text(
          //           'Pekanbaru',
          //           style: blackFontStyle3,
          //         )),
          //         DropdownMenuItem(
          //             child: Text(
          //           'Jakarta',
          //           style: blackFontStyle3,
          //         )),
          //       ],
          //       onChanged: (item) {}),
          // ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                validation();
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: mainColor,
              child: Text(
                'Countiue',
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
