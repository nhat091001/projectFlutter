import 'package:flutter/material.dart';
import 'package:screen1/screens/end_drawer_screen.dart';
import 'package:screen1/screens/test_validate.dart';
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
  String? valueChoose1;
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

  final items1 = [
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
                  activeTrackColor: Colors.white,
                  activeColor: Color(0xff3EAFC1),
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
        child: SafeArea(
            child: Form(
              key: _formKey,
              child: Container(
          child: Column(
              children: [

                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              'Frekvens',
                              style: TextStyle(color:isSwitched? Colors.black:Colors.grey, fontSize: 16),
                            ),
                            SizedBox(
                              width: 30,
                            ),

                            Radio(

                                 //isSwitched? Colors.black:Colors.grey, fontSize: 16,
                                activeColor: Color(0xff3EAFC1),
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
                                    color:isSwitched? Colors.black:Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Radio(
                                activeColor: Color(0xff3EAFC1),
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
                                    color:isSwitched? Colors.black:Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Radio(
                                activeColor: Color(0xff3EAFC1),
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
                                    color:isSwitched? Colors.black:Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Start',textAlign: TextAlign.center,style: TextStyle(color:isSwitched? Colors.black:Colors.grey,fontSize: 16,fontFamily: 'Roboto-Light'),),
                                  DropdownButton(
                                    hint: Text('Select item: ',style: TextStyle(color:isSwitched? Colors.black:Colors.grey,fontSize: 14,fontFamily: 'Roboto-Light')),
                                    dropdownColor: Colors.white,
                                    underline: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: Colors.black38)
                                      ),
                                    ),
                                    value: valueChoose,
                                    onChanged:isSwitched?(newValue) {
                                      setState(() {
                                        if(newValue!=null)
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
                                  Text('Stopp',style: TextStyle(color:isSwitched? Colors.black:Colors.grey,fontSize: 16,fontFamily: 'Roboto-Light')),
                                  DropdownButton(
                                    elevation: 0,
                                    underline: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: Colors.black38)
                                      ),
                                    ),
                                    hint: Text('Select item: ',style: TextStyle(color:isSwitched? Colors.black:Colors.grey,fontSize: 14,fontFamily: 'Roboto-Light')),
                                    dropdownColor: Colors.white,
                                    value: valueChoose1,
                                    onChanged:isSwitched?(newValue1) {
                                      setState(() {
                                        valueChoose1 = newValue1 as String?;

                                      });
                                    }:null,
                                    items: items1.map((valueItem1) {
                                      return DropdownMenuItem(
                                        value: valueItem1,
                                        child: Text(valueItem1),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              'Vibrera',
                              style: TextStyle(
                                fontSize: 15,
                                color:isSwitched? Colors.black:Colors.grey,
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
                              activeTrackColor: Colors.blue.shade100,
                              activeColor: Color(0xff3EAFC1),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  width: 300,
                  height: 50,
                  color:  Color(0xff3EAFC1),
                  child: FlatButton(

                    onPressed: (){

                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar( SnackBar(backgroundColor: Colors.blue,content: isSwitched?Text('Clicked'):Text('not cliecked')));
                      }
                    },
                    child: Text('SPARA',style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),

                SizedBox(height: 50,),
                Container(
                  width: 300,
                  height: 50,
                  color:  Color(0xff3EAFC1),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TestValidate()));
                    },
                    child: Text('SPARA2',style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ],
          ),
        ),
            )
        ),
      ),
      endDrawer: EndDrawerScreen(),
    );
  }
}

