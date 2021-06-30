part of 'pages.dart';

class KukePage extends StatefulWidget {
  @override
  _KukePageState createState() => _KukePageState();
}

class _KukePageState extends State<KukePage> {
  int selectedIndex = 0;

  UserLoginModel userLoginModel = new UserLoginModel();

  String userId = "0";
  bool isLoading = false;

  @override
  void initState() {
    readUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        Column(
          children: [
            //// header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: mainColor,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Kuke Market',
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Let's get some foods",
                        style: blackFontStyle.copyWith(
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ///// Rating & card kuke
            Container(
              height: 258,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: mockFoods
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  left: (e == mockFoods.first)
                                      ? defaultMargin
                                      : 0,
                                  right: defaultMargin),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/description_page');
                                  },
                                  child: FoodCard(e)),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),

            //// Populer Recomended
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ['New Taste', 'Popular', 'Recommended'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Builder(builder: (_) {
                    List<Food> foods = (selectedIndex == 0)
                        ? mockFoods
                        : (selectedIndex == 1)
                            ? []
                            : [];

                    return Column(
                      children: foods
                          .map((e) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 16),
                                child: FoodListItem(
                                    food: e, itemWidth: listItemWidth),
                              ))
                          .toList(),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    userId = await storage.read(key: Constanta.keyUserId);
    print(userId);
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
      } else {}
    });
  }
}
