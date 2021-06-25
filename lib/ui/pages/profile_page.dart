part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  UserLoginModel userLoginModel = new UserLoginModel();
  String userId = "0";
  bool isLoading = true;
  bool isAuth = false;

  @override
  void initState() {
    readUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return isLoading ? CircularProgressIndicator() : ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                height: 220,
                margin: EdgeInsets.only(bottom: defaultMargin),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/photo_border.png'))),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(mockUser.picturePath),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Text(
                      userLoginModel.name,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userLoginModel.email,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w300),
                    )
                  ],
                )),
            //// Body
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  // CustomTabBar(
                  //   titles: ["Account"],
                  //   selectedIndex: selectedIndex,
                  //   onTap: (index) {
                  //     setState(() {
                  //       selectedIndex = index;
                  //     });
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 12,
                  // ),
                  Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 5),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isAuth
                ? CircularProgressIndicator()
                : RaisedButton(
                  onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ChangeProfileScreen(userLoginModel: userLoginModel))
                  );
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    child: Text(
                      'Change Profile',
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
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ChangePasswordScreen(userLoginModel: userLoginModel))
                  );
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    child: Text(
                      'Change Password',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ],
    );
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    userId = await storage.read(key: Constanta.keyUserId);
    getDataUserLogin();
  }

  void getDataUserLogin() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": userId,
    };
    
    var requestBody = jsonEncode(map);
    UserLoginServices.getUserLogin(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        userLoginModel = UserLoginModel.fromJson(result.content);
        setState(() {
          isLoading = false;
        });
      } else {
        print(userId);
      }
    });
  }
}
