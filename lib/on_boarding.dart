import 'package:flutter/material.dart';
import 'package:flutter_walkthrough/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  final List<dynamic> images;
  final List<String> titles, subtitles;

  const OnBoarding(
      {Key? key,
      required this.images,
      required this.titles,
      required this.subtitles})
      : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(colorPrimary),
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) => OnBoardingPage(
              image: widget.images[index],
              title: widget.titles[index],
              subtitle: widget.subtitles[index],
            ),
            controller: pageController,
            itemCount: widget.titles.length,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Visibility(
            visible: _currentIndex + 1 == widget.titles.length,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Directionality.of(context) == TextDirection.ltr
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        shape: const StadiumBorder()),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pageController,
                count: widget.titles.length,
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

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}

class OnBoardingPage extends StatefulWidget {
  final dynamic image;
  final String title, subtitle;

  const OnBoardingPage(
      {Key? key, this.image, required this.title, required this.subtitle})
      : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.image is String
            ? Image.asset(
                widget.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              )
            : Icon(
                widget.image as IconData,
                color: Colors.white,
                size: 150,
              ),
        const SizedBox(height: 40),
        Text(
          widget.title.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.subtitle,
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
