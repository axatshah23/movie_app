import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int activeIndex = 0;
  final urlImages = [
    'assets/bg-2.jpg',
    'assets/bg.jpg',
    'assets/bg-4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            viewportFraction: 1.0,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return buildImage(urlImage, index);
          },
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Welcome to Movie',
                    style: kWelcomeHeadingTextStyle,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'The best Movie Movie Streaming app of the country to make your days great',
                    style: kWelcomeNormalTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  buildIndicator(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      onPrimary: Color(0x000000),
                      primary: kPrimaryColor,
                      padding: EdgeInsets.zero,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                          MediaQuery.of(context).size.height * 0.07),
                      elevation: 0.0,
                      shadowColor: kPrimaryColor,
                    ),
                    child: const Text(
                      'Getting Started',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 0.0),
        color: Colors.grey,
        child: Image.asset(
          urlImage,
          fit: BoxFit.fitHeight,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: const WormEffect(
          dotColor: Colors.grey,
          activeDotColor: kPrimaryColor,
          dotHeight: 10.0,
          dotWidth: 10.0,
        ),
      );
}
