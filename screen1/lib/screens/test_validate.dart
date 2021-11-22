import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio_button_form_field/radio_button_form_field.dart';
class TestValidate extends StatefulWidget {
  const TestValidate({Key? key}) : super(key: key);

  @override
  _TestValidateState createState() => _TestValidateState();
}

class _TestValidateState extends State<TestValidate> {
  final _formKey = GlobalKey<FormState>();
  bool isEnableg = false;
  bool isSwitched = true;
  bool isSwitched1 = false;
  String? valueChoose;
  String? valueChoose1;
  int? selected;



  late String default_choice ='';
   int default_index =0;
  List<MyChoice> choices = [
    MyChoice(index: 1, choice: "30m"),
    MyChoice(index: 2, choice: "1h"),
    MyChoice(index: 3, choice: "2h"),
  ];



  /////////
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
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Frekvens',
                      style: TextStyle(color:isSwitched? Colors.black:Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: isSwitched ? Colors.black : Colors.grey,
                                fontSize: 16,
                                fontFamily: 'Roboto-Light'),
                          ),
                          DropdownButton(
                            hint: Text('Select item: ',
                                style: TextStyle(
                                    color:
                                        isSwitched ? Colors.black : Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto-Light')),
                            dropdownColor: Colors.white,
                            underline: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.black38)),
                            ),
                            value: valueChoose,
                            onChanged: isSwitched
                                ? (newValue) {
                                    setState(() {
                                      if (newValue != null)
                                        valueChoose = newValue as String?;
                                    });
                                  }
                                : null,
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
                          Text('Stopp',
                              style: TextStyle(
                                  color:
                                      isSwitched ? Colors.black : Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Roboto-Light')),
                          DropdownButton(
                            elevation: 0,
                            underline: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.black38)),
                            ),
                            hint: Text('Select item: ',
                                style: TextStyle(
                                    color:
                                        isSwitched ? Colors.black : Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'Roboto-Light')),
                            dropdownColor: Colors.white,
                            value: valueChoose1,
                            onChanged: isSwitched
                                ? (newValue1) {
                                    setState(() {
                                      valueChoose1 = newValue1 as String?;
                                    });
                                  }
                                : null,
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
                    // Container(
                    //
                    //   child: Container(
                    //     child: Row(
                    //         children: choices.map((data) => Row(
                    //           children: [
                    //             Radio(
                    //                 value: data.index,
                    //                 groupValue: default_index,
                    //                 onChanged: (value){
                    //                   setState(() {
                    //                     default_choice=data.choice;
                    //                     default_index=data.index;
                    //                   });
                    //                 }
                    //             ),
                    //             Text('${data.choice}'),
                    //           ],
                    //         )
                    //         ).toList(),
                    //
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              height: 50,
              color: valueChoose != null && valueChoose1 != null && default_index>=1
                  ? Colors.cyan
                  : Colors.black,
              child: FlatButton(
                onPressed: valueChoose != null && valueChoose1 != null && default_index>=1
                    ? () {
                        setState(() {
                          print(valueChoose);
                          print(valueChoose1);
                          print(default_index);
                        });
                      }
                    : null,
                child: Text('SPARA2',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MyChoice {
  late String choice;
  late int index;

  MyChoice({
    required this.index,
    required this.choice,
  });
}

