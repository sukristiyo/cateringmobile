part of 'pages.dart';

class SignInPage extends StatefulWidget {
  static String tag = 'UserLogin';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  // final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  ApiResponse apiResponse;
  // TextEditingController

  @override
  void initState() {
    super.initState();
  }

  void authentication() {
    UserLoginModel userLoginModel = new UserLoginModel(
        email: emailController.text, password: passwordController.text);

// dialog alert
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    var requestBody = jsonEncode(userLoginModel.toJson());
    UserLoginServices.authentication(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        _showMyDialog();
      }
    }).catchError((error) {
      // String err = error.toString();
    });
    print(requestBody);
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
              style: whiteFontStyle2,
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
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  hintStyle: whiteFontStyle3,
                  hintText: 'Type your email address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: whiteFontStyle2,
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
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: 'Type your password',
                hintStyle: whiteFontStyle3,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1),
            alignment: FractionalOffset.bottomRight,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
                : RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot_page');
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: purpleColor,
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 5),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
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
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: whiteColor,
                  )
                : RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up_page');
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: whiteColor,
                    child: Text(
                      'Create To Account',
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
