import 'package:flutter/material.dart';
import 'package:flutter_walkthrough/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
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

  int _currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(colorPrimary),
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) => getPage(
              _imageList[index],
              _titlesList[index],
              _subtitlesList[index],
            ),
            controller: pageController,
            itemCount: _titlesList.length,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Visibility(
            visible: _currentIndex + 1 == _titlesList.length,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Directionality.of(context) == TextDirection.ltr
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        shape: const StadiumBorder()),
                  ),
                )),
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
    );
  }

  Widget getPage(dynamic image, String title, String subTitle) {
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
        const SizedBox(height: 40),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
