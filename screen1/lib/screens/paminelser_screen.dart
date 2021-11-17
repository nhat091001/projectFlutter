import 'package:flutter/material.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import '../drawer_screen.dart';

class PaminelserScreen extends StatefulWidget {
  @override
  _PaminelserScreenState createState() => _PaminelserScreenState();
}

class _PaminelserScreenState extends State<PaminelserScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitched = true;
  bool isSwitched1 = false;
  String? valueChoose;
  int? selected;


  final items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff3EAFC1),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PÅMINNELSER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Roboto-Medium'),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                )
              ],
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
      body: Container(
        color: isSwitched?Colors.white:Colors.grey.shade300,

        child: SafeArea(

            child: Form(
              key: _formKey,
              child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Frekvens',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Radio(
                        value: 1,
                        groupValue: selected,
                        onChanged:isSwitched?(val) {
                              (val){
                            setState(() {
                              print(val);
                            });
                          };
                          print(val);
                          setSelectedRadio(val as int);
                        }:null),
                    Text('30m',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Radio(
                        value: 2,
                        groupValue: selected,
                        onChanged:isSwitched?(val) {
                              (val){
                            setState(() {
                              print(val);
                            });
                          };
                          print(val);
                          setSelectedRadio(val as int);
                        }:null),
                    Text('1h',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Radio(
                        value: 3,
                        groupValue: selected,
                        onChanged:isSwitched? (val) {

                              (val){
                            setState(() {
                              print(val);
                            });
                          };
                          print(val);
                          setSelectedRadio(val as int);
                        }:null),
                    Text('2h',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start'),
                          DropdownButton(
                            hint: Text('Select item: '),
                            dropdownColor: Colors.white,
                            value: valueChoose,
                            onChanged:isSwitched?(newValue) {
                              setState(() {
                                valueChoose = newValue as String?;
                              });
                            }:null,
                            items: items.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Stopp'),
                          DropdownButton(
                            hint: Text('Select item: '),
                            dropdownColor: Colors.white,
                            value: valueChoose,
                            onChanged:isSwitched?(newValue) {
                              setState(() {
                                valueChoose = newValue as String?;
                              });
                            }:null,
                            items: items.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        'Vibrera',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      Switch(
                        value: isSwitched1,
                        onChanged:isSwitched?(value) {
                          isSwitched1 = value;
                          setState(() {
                            print(isSwitched1);

                          });

                        }:null,
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  height: 50,
                  color:  Color(0xff3EAFC1),
                  child: FlatButton(

                    onPressed: (){

                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.blue,content: Text('Processing Data')));
                      }
                    },
                    child: Text('SPARA',style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),

                ),
              ],
          ),
        ),
            )),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}
