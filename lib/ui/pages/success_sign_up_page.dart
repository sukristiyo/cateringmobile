part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: IllustrationPage(
          title: "Yeay! Completed",
          subtitle: "Now you are able to order\nsome foods as a self reward",
          picturePath: 'assets/Cooking-cuate 1.png',
          buttonTap1: () {Get.offAll(MainPage());},
          buttonTitle1: 'Find Foods',
        ));
  }
}
