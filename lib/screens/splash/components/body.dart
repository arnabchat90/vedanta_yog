import 'package:flutter/material.dart';
import 'package:vedanta_yoga/constants.dart';
import 'package:vedanta_yoga/screens/sign_in/sign_in.dart';
import 'package:vedanta_yoga/screens/splash/components/splash_container.dart';
import 'package:vedanta_yoga/shared/default_button.dart';
import 'package:vedanta_yoga/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'text': 'Welcome to Vedanta Yoga, Let\'s meditate!',
      'image': 'assets/animations/yoga.json',
      'type': 'animation'
    },
    {
      'text': 'Welcome to Vedanta Yoga, Let\'s meditate!',
      'image': 'assets/images/logo.jpg',
      'type': 'image'
    },
    {
      'text': 'Yoga is for everyone, age is just a number!',
      'image': 'assets/images/all_ages.jpg',
      'type': 'image'
    },
    {
      'text': 'Challenge yourself everyday, be a pro!',
      'image': 'assets/images/challenge.jpg',
      'type': 'image'
    },
    {
      'text': 'Yoga is extremely therapautic!',
      'image': 'assets/images/therapeutic.jpg',
      'type': 'image'
    },
    {
      'text': 'Your fitness is in your hands!',
      'image': 'assets/images/fitness.jpg',
      'type': 'image'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContainer(
                          text: splashData[index]['text'],
                          image: splashData[index]['image'],
                          type: splashData[index]['type'],
                        ))),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index))),
                    Spacer(
                      flex: 3,
                    ),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        Navigator.pushNamed(context, SignIn.routeName);
                      },
                    ),
                    Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
        duration: vAnimationDuration,
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
            color: currentPage == index ? vPrimaryColour : Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3)));
  }
}
