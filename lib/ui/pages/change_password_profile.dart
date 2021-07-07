part of 'pages.dart';

class ChangePasswordScreen extends StatefulWidget {
  final UserLoginModel userLoginModel;
  const ChangePasswordScreen({Key key, this.userLoginModel}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController txtoldpass = TextEditingController();
  TextEditingController txtnewpass = TextEditingController();
  TextEditingController txtrepass = TextEditingController();

  String userId = "0";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Penambahan onTap pada General Page.
    //sehingga, ketika kita menekan area selain textfield, maka keyboard akan kembali menutup
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GeneralPage(
        title: 'Change Password',
        subtitle: "Fill your current and new password",
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(margin: EdgeInsets.all(8)),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: txtoldpass,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                    hintText: "Type current password",
                    prefixIcon: Icon(Icons.vpn_key),
                  ),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: txtnewpass,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                    hintText: "Type New Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: txtrepass,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                    hintText: "Re-type New Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 24, left: defaultMargin, right: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ButtonTheme(
                  buttonColor: mainColor,
                  minWidth: double.infinity,
                  height: 45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    onPressed: () => changePasswd(),
                    child: Text(
                      "APPLY",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
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

  void changePasswd() {
    bool isValid = true;
    txtoldpass.text == widget.userLoginModel.password &&
            txtnewpass.text == txtrepass.text
        ? isValid = true
        : isValid = false;
    print(widget.userLoginModel.id);
    print(widget.userLoginModel.password);
    print(txtrepass.text);

    if (isValid) {
      setState(() {
        isLoading = true;
      });
      //update password
      UserLoginModel userLoginModel = new UserLoginModel(
          id: widget.userLoginModel.id, password: txtnewpass.text);

      var requestBody = jsonEncode(userLoginModel.toJson());
      UserLoginServices.updateData(requestBody).then((value) {
        final result = value;
        if (result.success == true && result.code == 200) {
          _successDialog();
          isLoading = false;
        } else {}
      }).catchError((error) {
        //String err = error.toString();
      });
      print(requestBody);
    } else {
      _failedDialog();
    }
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Change Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Your password is changed!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          );
        });
  }

  Future<void> _failedDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Change Failed"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Current Password or New Password is invalid"),
                  Text("Please fill all fields properly"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
