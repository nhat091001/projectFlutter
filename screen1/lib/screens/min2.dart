import 'package:flutter/material.dart';
import 'package:screen1/constants.dart';
import 'package:screen1/screens/logg_screen.dart';

import 'end_drawer_screen.dart';

class Min2Screen extends StatefulWidget {
  @override
  _Min2ScreenState2 createState() => _Min2ScreenState2();
}

class _Min2ScreenState2 extends State<Min2Screen> {
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
            Icons.close,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
       child: SingleChildScrollView(
         child: Container(
           margin: EdgeInsets.fromLTRB(15, 15, 15, 20),
           child: Column(
             
             children: [
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
                         TextSpan(text: 'Du kan när som helst avbryta prenumerationen. Så här går det till: ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                        
                       ]
                   ),
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
                         TextSpan(text: '1. ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Medium')),
                         TextSpan(text: 'Öppna Inställningar i telefonen (det grå kugghjulet). ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),
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
                         TextSpan(text: '2. ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Medium')),
                         TextSpan(text: 'Tryck på ditt namn och sedan på ”Prenumerationer”. ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),
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
                         TextSpan(text: '3. ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Medium')),
                         TextSpan(text: '   Tryck på den prenumeration du vill hantera (”Hjärnfokus”). ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),
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
                         TextSpan(text: '4. ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Medium')),
                         TextSpan(text: 'Tryck på ”Avbryt prenumeration” ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),
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
                         TextSpan(text: 'Du kan även gå in på ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                         TextSpan(text: 'Apples hemsida ',style: kTextDecoration),
                         TextSpan(text: 'och få en mer detaljerad beskrivning. ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),

                 ),
               ),
               SizedBox(
                 height: 15,
               ),
               Container(
                 child: RichText(
                   text: TextSpan(children: <TextSpan>[


                     TextSpan(
                         text:
                         'Hör av dig till oss om du inte lyckas avbryta prenumerationen genom att följa instruktionerna ovan: ',
                         style: TextStyle(
                           fontSize: 16,
                           fontFamily: 'Roboto-Light',
                         ),
                     ),
                     TextSpan(
                     text:
                         'support@mindfulnessapps.com.',
                         style: kTextDecoration
                     ),


                   ]),
                 ),
               ),
                SizedBox(height: 20,),
               Container(
                 alignment: Alignment.centerLeft,
                 child: RichText(
                   text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(text: 'Observera att vi inte kan avbryta prenumerationen åt dig.',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),

                       ]
                   ),

                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 alignment: Alignment.center,
                 child: RichText(
                   text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(text: 'Integritetspolicy',style: TextStyle(fontSize: 20,fontFamily: 'Roboto-Medium')),
                       ]
                   ),

                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 alignment: Alignment.center,
                 child: RichText(
                   text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),

                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 alignment: Alignment.center,
                 child: RichText(
                   text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),

                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 alignment: Alignment.center,
                 child: RichText(
                   text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(text: 'Användarvillkor',style: TextStyle(fontSize: 20,fontFamily: 'Roboto-Medium')),
                       ]
                   ),

                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 alignment: Alignment.center,
                 child: RichText(
                   text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. '
                             ,style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),

                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 alignment: Alignment.center,
                 child: RichText(
                   text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',style: TextStyle(fontSize: 16,fontFamily: 'Roboto-Light')),
                       ]
                   ),

                 ),
               ),
             ],
           ),
         ),
       ),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}
