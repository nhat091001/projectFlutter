import 'package:flutter/material.dart';

class TestValidate extends StatefulWidget {
  const TestValidate({Key? key}) : super(key: key);

  @override
  _TestValidateState createState() => _TestValidateState();
}

class _TestValidateState extends State<TestValidate> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Container(

        child: Column(
          children: [
            DropdownButtonFormField(
              hint: Text('Start1'),

              value: valueChoose,
              items: items.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
              onChanged:isSwitched?(newValue) {
                setState(() {
                    valueChoose = newValue as String?;
                });
              }:null,
              validator: (newValue)=>newValue==null?'dddddf ':null,
            ),

            SizedBox(height: 50,),
            Container(
              width: 300,
              height: 50,
              color:  Color(0xff3EAFC1),
              child: FlatButton(
                onPressed: (){
                  print('dsds ${this.valueChoose}');
                },
                child: Text('SPARA2',style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
