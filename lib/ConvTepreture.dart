import 'package:flutter/material.dart';

class Tempreture_Converter extends StatefulWidget {
  @override
  _Tempreture_ConverterState createState() => _Tempreture_ConverterState();
}

class _Tempreture_ConverterState extends State<Tempreture_Converter> {


  TextStyle _TextStyle = TextStyle(color: Colors.white , fontSize: 20);

  double _radius = 50;

  double fashValue =0;
  double celValue =0;
  //double kelValue =0;

  bool isFash = true;
  bool isKev = false;

  var Controller_1 = TextEditingController();
  var Controller_2 = TextEditingController();


/*
  colction(){
    setState(() {
      if(selectedItem == firstSelector[0] && selectedItem2 == firstSelector[1]){      //'Fahrenheit'  to  'Celsius'
        fashValue = double.parse(Controller_1.text);
        celValue = convert(fashValue, true , false);
        if(isFash) Controller_2.text = celValue.toString();
        isFash = true;
        isKev = false;
      }
      else if(selectedItem == firstSelector[0] && selectedItem2 == firstSelector[2]){      //'Fahrenheit'  to  'Kelvin'
        fashValue = double.parse(Controller_1.text);
        kelValue = convert(fashValue, false , true);
        if(!isFash) Controller_2.text = kelValue.toString();
        isFash = false;
        isKev = true;
      }
      else if(selectedItem == firstSelector[1] && selectedItem2 == firstSelector[0]){      //'Celsius'  to  'Fahrenheit'
        celValue = double.parse(Controller_1.text);
        fashValue = convert(celValue, true , false);
        if(isFash) Controller_2.text = fashValue.toString();
        isFash = true;
        isKev = false;
      }
      else if(selectedItem == firstSelector[1] && selectedItem2 == firstSelector[2]){      //'Celsius'  to  'Kelvin'
        celValue = double.parse(Controller_1.text);
        kelValue = convert(celValue, false , true);
        if(!isFash) Controller_2.text = kelValue.toString();
        isFash = false;
        isKev = true;
      }
      /// .....

    });



  }
*/

  Listener_1(){
    setState(() {
      Controller_1.text.isEmpty ? null :
      Controller_1.text == '-' ? null :
      fashValue = double.parse(Controller_1.text);
      celValue = convert(fashValue, true );
      if(isFash) Controller_2.text = celValue.toString();
      isFash = true;
    });
  }

  Listener_2(){
    setState(() {
      Controller_2.text.isEmpty ? null :
      Controller_2.text == '-' ? null :
      celValue = double.parse(Controller_2.text);
      fashValue = convert(celValue, false );
      if(!isFash) Controller_1.text = fashValue.toString() ;
      isFash = false;
    });
  }

  double convert(double temp  ,  bool isFa ){
    return isFa ? (temp - 32) * (5/9) : (temp * 9/5) +32 ;
  }

  @override
  void initState() {
    Controller_1.addListener(Listener_1);
    Controller_2.addListener(Listener_2);
    super.initState();
  }


  static List firstSelector = ['Fahrenheit' , 'Celsius' , 'Kelvin'];
  String selectedItem = firstSelector[0];
  String selectedItem2 = firstSelector[1];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red , Colors.deepOrange ,  Colors.blue , Colors.lightBlue , Colors.lightBlueAccent ],
              begin: Alignment. bottomCenter,
              end:  Alignment.topCenter,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Container(
              width: _radius*2  ,height: _radius*2,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('images/Temp_Circule.png'),
                    //backgroundImage: CacheImage('https://lh3.googleusercontent.com/proxy/d-q5Eau7iK1EtpWsfpljwTxOhYA6i9t9g-lOWtaVYe3RQ0uTNsuMaQpOOOCNAVJCLG4TtWyOdjBKHg66I97qnAxPuOpcBcsFyRHcjNqa_DX7g3rwkDafUbiAD8Y' ,  duration: Duration(seconds: 0) , durationExpiration: Duration(seconds: 0) , cache: true , durationMultiplier: 0),
                    radius: _radius,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/Temp_SmallCircule.jpg'),
                      radius: _radius/3,
                    ),
                  ),
                ],
              ),
            ),


            Row(
              children: <Widget>[

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: Controller_1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: '${selectedItem.substring(0,1)}',
                        suffixStyle: _TextStyle,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: Controller_2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: '${selectedItem2.substring(0,1)}',
                        suffixStyle: _TextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SelectedButton(selecting){
    return DropdownButton(

      value: selecting,
      onChanged: (currentSeleted) {
        setState(() {
          selecting == selectedItem ?
          selectedItem = currentSeleted :
          selectedItem2 = currentSeleted  ;
        });
      },
      items: firstSelector.map((f){
        return DropdownMenuItem(
          child: Text(f , style: TextStyle(fontSize: 20),),
          value: f,
        );
      }).toList(),
      iconEnabledColor: Colors.yellow,
    );
  }
}
