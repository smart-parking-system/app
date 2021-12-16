import 'package:sps/utils/strings.dart';

class OnBoardingItem {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingItem({this.title, this.subTitle, this.image});
}

class OnBoardingItems {
  static List<OnBoardingItem> loadOnboardItem () {
    const fi = <OnBoardingItem> [
      OnBoardingItem(
        title: Strings.title1,
        subTitle: Strings.subTitle1,
        image: 'assets/images/onboard/1.png',
      ),
      OnBoardingItem(
        title: Strings.title2,
        subTitle: Strings.subTitle2,
        image: 'assets/images/onboard/2.png',
      ),
      OnBoardingItem(
        title: Strings.title3,
        subTitle: Strings.subTitle3,
        image: 'assets/images/onboard/3.png',
      ),
    ];
    return fi;
  }
}