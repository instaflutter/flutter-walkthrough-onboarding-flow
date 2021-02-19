import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const COLOR_ACCENT = 0xFFd756ff;
const COLOR_PRIMARY_DARK = 0xFF6900be;
const COLOR_PRIMARY = 0xFFa011f2;

final List<String> _titlesList = [
  'Flutter OnBoarding',
  'Firebase Auth',
  'Facebook Login',
  'Instaflutter.com',
  'Jump straight into the action.'
];
final List<String> _subtitlesList = [
  'Build your onBoarding flow in seconds.',
  'Use Firebase for user managements.',
  'Leverage Facebook to log in user easily.',
  'Get more awesome templates',
  'Get Started'
];
final List<dynamic> _imageList = [
  Icons.developer_mode,
  Icons.layers,
  Icons.account_circle,
  'assets/images/ic_launcher_round.png',
  Icons.code
];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(COLOR_PRIMARY),
        body: Stack(
          children: <Widget>[
            PageView.builder(
              itemBuilder: (context, index) => getPage(
                  _imageList[index],
                  _titlesList[index],
                  _subtitlesList[index],
                  context,
                  index + 1 == _titlesList.length),
              controller: pageController,
              itemCount: _titlesList.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: _titlesList.length,
                  effect: ScrollingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey.shade400,
                      dotWidth: 8,
                      dotHeight: 8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPage(dynamic image, String title, String subTitle,
      BuildContext context, bool isLastPage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        image is String
            ? Image.asset(
                image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              )
            : Icon(
                image as IconData,
                color: Colors.white,
                size: 150,
              ),
        SizedBox(height: 40),
        Text(
          title.toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _currentIndex + 1 == _titlesList.length
              ? OutlineButton(
                  onPressed: () {},
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  borderSide: BorderSide(color: Colors.white),
                  shape: StadiumBorder(),
                )
              : Text(
                  subTitle,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
        ),
      ],
    );
  }
}

void main() => runApp(MyApp());