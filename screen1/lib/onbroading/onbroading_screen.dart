import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen1/constants.dart';
import 'package:screen1/data/colors.dart';
import 'package:screen1/models/onbroading_models.dart';
import 'package:screen1/models/ovningar_list_model.dart';
import '../screens/ovningar.dart';
import '../models/practice_models.dart';

class OnbroadingScreen extends StatefulWidget {
  @override
  _OnbroadingScreenState createState() => _OnbroadingScreenState();
}

PageController _pageController = PageController();
int selectedPage = 0;

nextPage() {
  _pageController.nextPage(
      duration: const Duration(milliseconds: 200), curve: Curves.ease);
}

previousPage() {
  _pageController.previousPage(
      duration: const Duration(milliseconds: 200), curve: Curves.ease);
}

class _OnbroadingScreenState extends State<OnbroadingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColor,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    selectedPage = value;
                  });
                },
                controller: _pageController,
                itemCount: onbroading.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 360,
                    height: 640,
                    child: Column(
                      children: [
                        Image.asset(
                          onbroading[index].imageAsset,
                          width: 360,
                          height: 385,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: Text(
                            onbroading[index].title,
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Roboto-Medium'),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            onbroading[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Roboto-Light',
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Container(
              width: 138,
              height: 41,
              margin: EdgeInsets.only(bottom: 25),
              child: Visibility(
                visible: selectedPage == 2 ? true : false,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(18)),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OvningarScreen()));
                    });
                  },
                  child: Text('KOM IGÅNG',
                      style: TextStyle(
                          color: Color(0xFF2B9EB1),
                          fontSize: 17,
                          fontFamily: 'Roboto-Medium')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: selectedPage == 0 ? false : true,
                    child: InkWell(
                        onTap: () {
                          previousPage();
                        },
                        child: Image.asset(
                          'assets/images/previous.png',
                          width: 38.74,
                          height: 38.74,
                        )),
                  ),
                  Visibility(
                    visible: selectedPage == 2 ? false : true,
                    child: Container(
                      margin: selectedPage == 0
                          ? EdgeInsets.fromLTRB(38, 0, 0, 0)
                          : EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        children: List.generate(
                            onbroading.length,
                            (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedPage == index
                                          ? kIconColor
                                          : kTitleColor.withOpacity(.5)),
                                )),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: selectedPage == 2 ? false : true,
                    child: InkWell(
                        onTap: () {
                          nextPage();
                        },
                        child: Image.asset(
                          'assets/images/next.png',
                          width: 38.74,
                          height: 38.74,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
