part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
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
          ],
        )
      ],
    );
  }
}
