import 'package:flutter/material.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import '../drawer_screen.dart';
import '../constants.dart';

class OmHjarnFokusScreen extends StatefulWidget {
  @override
  _OmHjarnFokusScreenState createState() => _OmHjarnFokusScreenState();
}

class _OmHjarnFokusScreenState extends State<OmHjarnFokusScreen> {
  String book = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3EAFC1),
      appBar: AppBar(
        backgroundColor: Color(0xff3EAFC1),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Text(
              'OM HJÄRNFOKUS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Roboto-Medium'),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(),
        ),
        title: Container(
          margin: EdgeInsets.fromLTRB(110, 10, 0, 0),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                      'I appen Hjärnfokus hittar du guidade övningar för mer lugn, fokus, kreativitet och glädje. Många av övningarna är 5 minuter eller kortare för att du lättare ska få in dem i din vardag. Ta en powerpaus, en fokusminut eller kom till ro med övningen Somna.',
                      style: kTextStyleOH),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text:
                            'Johan Bergstad – leg. psykolog, föreläsare och en av Sveriges främsta experter på fokusträning – guidar dig genom övningarna. Läs mer i boken ',
                        style: kTextStyleOH),
                    TextSpan(
                        text:
                            'Hjärnfokus – Så blir du lugn, kreativ och fokuserad.',
                        style: kTextDecoration),
                  ])),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 181,
              width: 360,
              child: Image.asset(
                'assets/images/about-us.jpeg',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Guide till övningarna',
                    style: kTextStyleOH1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(text: 'Lyssna på ', style: kTextStyleOH),
                      TextSpan(text: 'Introduktion ', style: kTextOH),
                      TextSpan(
                          text:
                              'innan du gör övningarna första gången. Börja med ',
                          style: kTextStyleOH),
                      TextSpan(text: 'Tre medvetna andetag', style: kTextOH),
                      TextSpan(text: ' eller ', style: kTextStyleOH),
                      TextSpan(text: 'Fokusminuten', style: kTextOH),
                      TextSpan(
                          text:
                              ' och gå sedan vidare till de längre övningarna. Många använder ',
                          style: kTextStyleOH),
                      TextSpan(text: 'Skarpt fokus ', style: kTextOH),
                      TextSpan(text: 'och ', style: kTextStyleOH),
                      TextSpan(text: 'PARK ', style: kTextOH),
                      TextSpan(
                          text:
                              'för att kalibrera hjärnan i början av dagen (PARK står för Position – Andas – Räkna andetagen – Kom tillbaka). ',
                          style: kTextStyleOH),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Behöver du vila och återhämtning så finns ',
                          style: kTextStyleOH),
                      TextSpan(text: 'Powerpausen ', style: kTextOH),
                      TextSpan(
                          text:
                              'i olika tidslängd, och vill du ha hjälp att komma till ro på kvällen inför att du ska sova rekommenderar vi övningen ',
                          style: kTextStyleOH),
                      TextSpan(text: ' Somna. ', style: kTextOH),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text:
                              'Träna bara när det passar utifrån situationen du befinner dig i. Det är till exempel inte lämpligt att öva när du kör bil eller gör något annat som kräver ditt fokus. Om du har fysiska eller psykiska hälsoutmaningar bör du rådfråga en läkare innan du övar. Avstå från stretchrörelserna i',
                          style: kTextStyleOH),
                      TextSpan(text: ' Mjukstarta dagen ', style: kTextOH),
                      TextSpan(
                          text:
                              'om du till exempel har problem med ryggen eller nacken.  ',
                          style: kTextStyleOH),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text:
                              'Hjärnfokus definieras som en icke-dömande uppmärksamhet i nuet. Du kan avsiktligt styra denna uppmärksamhet dit du vill (för mer information, se boken Hjärnfokus sidan 21). Du riktar uppmärksamheten och när den vandrar för du tillbaka den. Tack vare att fokus vandrar får du motståndet som behövs för att lyfta den inre hanteln och träna hjärnan.',
                          style: kTextStyleOH),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text:
                              'När du har lärt dig en övning kan du själv ställa in tidslängden och öva till ',
                          style: kTextStyleOH),
                      TextSpan(text: 'Tystnad med klockor. ', style: kTextOH),
                      TextSpan(
                          text: 'Du kan även använda ', style: kTextStyleOH),
                      TextSpan(text: 'Påminnelser ', style: kTextOH),
                      TextSpan(
                          text:
                              'och få en påminnelse att öva till exempel en gång varannan timme. ',
                          style: kTextStyleOH),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(text: 'På '),
                      TextSpan(text: 'hjärnfokus.se', style: kTextDecoration),
                      TextSpan(
                          text:
                              ' finns mer information om boken och tips och trix för att må bättre och samtidigt få mer gjort med mindre energi. ',
                          style: kTextStyleOH),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Denna app är framtagen av ',
                          style: kTextStyleOH),
                      TextSpan(text: 'Mindfulness Apps.', style: kTextStyleOH),
                      TextSpan(
                          text:
                              ' Ta gärna kontakt med oss om du har synpunkter på hur appen ska förbättras:  ',
                          style: kTextStyleOH),
                      TextSpan(
                          text: 'support@mindfulnessapps.com',
                          style: kTextDecoration),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Här kan du läsa om hur vi hanterar ',
                          style: kTextStyleOH),
                      TextSpan(
                          text: 'personuppgifter. ', style: kTextDecoration),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Lycka till med träningen!',
                    style: kTextStyleOH2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}
