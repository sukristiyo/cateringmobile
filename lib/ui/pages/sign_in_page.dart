part of 'pages.dart';

class SignInPage extends StatefulWidget {
  static String tag = 'UserLogin';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isAuth = false;
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  

  UserLoginModel userLoginModel = new UserLoginModel();
  ApiResponse apiResponse;

  String uemail;

  @override
  void initState() {
    super.initState();
  }

    void authentication() {
    setState(() {
      isAuth = true;
    });
    UserLoginModel userLoginModel = new UserLoginModel(
        email: emailController.text, password: passwordController.text);

        var requestBody = jsonEncode(userLoginModel.toJson());
    print(requestBody);
    UserLoginServices.authentication(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
          uemail= userLoginModel.email.toString();
        _storeUserData();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessSignUpPage()),
        );
      } else {
        _showMyDialog();
      }
      setState(() {
        isAuth = false;
      });
    }).catchError((error) {
      setState(() {
        isAuth = false;
      });
      print(error.toString());
      // String err = error.toString();
    });
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your email or password is invalid.'),
                Text('Please try again !!!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // void _storeLoginData(String email) async {
  //   final storage = FlutterSecureStorage();
  //   await storage.write(key: Constanta.keyEmail, value: email);
  // }

  void _storeUserData() async {
    final storage = FlutterSecureStorage();
    await storage.write(
      key: Constanta.keyEmail,
      value: uemail
    );
    print(uemail);
  }



   
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign In',
      subtitle: "Find your best ever meal",
      child: Column(
        children: [
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
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              controller: emailController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email, color: Colors.black),
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
                border: Border.all(color: "FFC700".toColor())),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.lock, color: Colors.black),
                hintText: 'Type your password',
                hintStyle: blackFontStyle3,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1),
            alignment: FractionalOffset.bottomRight,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child:
                // isLoading
                //     ? SpinKitFadingCircle(
                //         size: 45,
                //         color: mainColor,
                //       ) :
                RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgot_page');
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: whiteColor,
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 5),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isAuth
                ? CircularProgressIndicator()
                : RaisedButton(
                    onPressed: () {
                      authentication();
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child:
                // isLoading
                //     ? SpinKitFadingCircle(
                //         size: 45,
                //         color: whiteColor,
                //       ) :
                RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign_up_page');
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: purpleColor,
              child: Text(
                'Create To Account',
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
