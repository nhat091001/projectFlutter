import 'package:flutter/material.dart';
import 'package:screen1/screens/logg_screen.dart';

import 'end_drawer_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3EAFC1),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff3EAFC1),
        leading: IconButton(
          iconSize: 20,
          color: Colors.white,
          icon: Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                width: 200,
                child: Image.asset('assets/images/logo_purchase.png'),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Vill du få mer hjärnfokus?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto-Medium',
                      fontSize: 28),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Då har du kommit rätt! Den här appen ger dig verktygen och övningarna du behöver. Testa gratis i 30 dagar. Därefter kan du välja mellan att betala per månad eller år. Du kan när som helst avbryta prenumerationen.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto-Light',
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      width: 219,
                      height: 39,
                      child: FlatButton(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            '49 kr / månad',
                            style: TextStyle(
                                color: Color(0xff2B9EB1),
                                fontSize: 18,
                                fontFamily: 'Lato-Bold'),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 219,
                      height: 39,
                      child: FlatButton(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoggScreen()));
                          },
                          child: Text(
                            '395 kr / år',
                            style: TextStyle(
                                color: Color(0xff2B9EB1),
                                fontSize: 18,
                                fontFamily: 'Lato-Bold'),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  'Återställ köp',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato-Bold',
                      fontSize: 14),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: RichText(
                  text: TextSpan(children: const <TextSpan>[
                    TextSpan(
                        text:
                            'De första 30 dagarna provar du kostnadsfritt. Därefter förnyas prenumerationen automatiskt om den inte avbryts senast 24 timmar innan en pågående period löper ut (månad eller år). Här kan du läsa mer om ',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto-Light',
                        )),
                    TextSpan(
                        text:
                            'hur du avbryter prenumerationen, användarvillkor och integritetspolicy',
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Roboto-Light',
                        )),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}
