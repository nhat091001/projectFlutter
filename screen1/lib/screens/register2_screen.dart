import 'package:flutter/material.dart';
import 'package:screen1/screens/logg_screen.dart';

import 'end_drawer_screen.dart';

class RegisterScreen2 extends StatefulWidget {
  @override
  _RegisterScreenState2 createState() => _RegisterScreenState2();
}

class _RegisterScreenState2 extends State<RegisterScreen2> {
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
              Container(
                height: 180,
                width: 200,
                child: Image.asset('assets/images/logo_purchase.png'),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Aktiv prenumeration',
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
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Tack för din prenumeration. Du har valt att betala: ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                      TextSpan(text: 'Månadsvis',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Medium')),
                      TextSpan(text: ' Förnyas: ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                      TextSpan(text: '6 aug 2021',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Medium')),
                    ]
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Text('Vill du byta till årlig betalning?',style: TextStyle(fontFamily: 'Roboto-Light',fontSize: 16,color: Colors.white),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 219,
                      height: 39,
                      child: FlatButton(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          color: Colors.white,
                          onPressed: () {},
                          child: Text(
                            '395 kr / år',
                            style: TextStyle(
                                color: Color(0xff2B9EB1),
                                fontSize: 18,
                                fontFamily: 'Lato-Bold'),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text('Vill du avbryta prenumerationen?',style: TextStyle(fontFamily: 'Roboto-Light',fontSize: 16,color: Colors.white),),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
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
                            'Avbryt',
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
                height: 75,
              ),


              Container(
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
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
