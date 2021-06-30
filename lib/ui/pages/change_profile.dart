part of 'pages.dart';

class ChangeProfileScreen extends StatefulWidget {
  final UserLoginModel userLoginModel;

  const ChangeProfileScreen({Key key, this.userLoginModel}) : super(key: key);

  @override
  _ChangeProfileScreenState createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  UserLoginModel userLoginModel = new UserLoginModel();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.userLoginModel.email;
    nameController.text = widget.userLoginModel.name;
    phoneController.text = widget.userLoginModel.phoneNumber;
    addressController.text = widget.userLoginModel.address;
    houseController.text = widget.userLoginModel.houseNumber;
    cityController.text = widget.userLoginModel.city;

    super.initState();
  }

  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userId = "0";
  bool isLoading = false;

  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : GeneralPage(
            title: 'Profile',
            subtitle: "Edit the fields below to change profile data",
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
                      controller: emailController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        hintText: userLoginModel.email,
                        labelText: "Email Address",
                        prefixIcon: Icon(Icons.mail),
                      ),
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin:
                        EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        hintText: userLoginModel.name,
                        labelText: "Full Name",
                        labelStyle: yellowFontStyle1,
                        // hintStyle: blackFontStyle,
                        prefixIcon: Icon(Icons.person),
                      ),
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin:
                        EdgeInsets.fromLTRB(defaultMargin, 5, defaultMargin, 5),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        hintText: userLoginModel.phoneNumber,
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.phone_android),
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
                      child: isLoading
                          ? CircularProgressIndicator()
                          : RaisedButton(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () => updateProfile(),
                              child: Text(
                                "APPLY",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  void updateProfile() {
    setState(() {
      isLoading = true;
    });

    UserLoginModel userLoginModel = new UserLoginModel(
        id: widget.userLoginModel.id,
        email: emailController.text,
        name: nameController.text,
        phoneNumber: phoneController.text);

    var requestBody = jsonEncode(userLoginModel.toJson());
    UserLoginServices.updateData(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        _successDialog();
      } else {
        _failedDialog();
      }
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      String err = error.toString();
      print(err);
    });
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Your Profile is Updated!"),
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
            title: Text("Update Failed"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Oops, something went wrong"),
                  Text("Please check all the possible mistakes"),
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
