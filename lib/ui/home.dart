import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home>{

  TextEditingController _ageController= new TextEditingController();
  TextEditingController _weightController= new TextEditingController();
  TextEditingController _heightController= new TextEditingController();
  //TextEditingController _bmi= new TextEditingController();
  double bmi;
  String answer;
  TextEditingController _formattedText=new TextEditingController();

  void _calculateBMI() {
    setState(() {

      double height= double.parse(_heightController.text);
      double weight= double.parse(_weightController.text);
      bmi=(weight/(height*height*144))*703;
      answer= bmi.toStringAsFixed(1);
      if(bmi<18.5)
        {
          _formattedText.text="UnderWeight";
        }
      else if(bmi>=18.5&&bmi<=24.9)
        {
          _formattedText.text="Normal";
        }
      else if(bmi>24.9&&bmi<=29.9)
      {
        _formattedText.text="OverWeight";
      }
      else
        _formattedText.text="Obese";
    });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.white,

      body: new Container(
        alignment:  Alignment.center,
        child:  new ListView(
          padding: const EdgeInsets.all(15.5),
          children: <Widget>[
            new Image.asset('images/bmi.png',
                width:200.0,
                height: 180.0,),

            new Container(
              child:  new Column(
                children: <Widget>[
                  //Age
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "Age rounded of in years",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),

                  //height
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Height",
                      hintText: "Height in feet",
                      icon: new Icon(Icons.insert_chart),
                    ),
                  ),

                  //weight
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight",
                      hintText: "Weight in pounds",
                      icon: new Icon(Icons.line_weight),
                    ),
                  )

                ],
              ),
            ),

            new Padding(padding: new EdgeInsets.all(12.5)),
            new Container(
              margin: const EdgeInsets.only(left: 85.0,right: 85.0),
            child:  new RaisedButton(onPressed: _calculateBMI,
            color: Colors.pink,
            child:  new Text("Calculate BMI",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w700


            ),),),
            ),
            new Padding(padding: EdgeInsets.all(8.5)),

            new Center(
                child: new Text((_weightController.text.isEmpty||_heightController.text.isEmpty||_ageController.text.isEmpty)?"Please enter a height and Weight":"${answer} is your BMI.",
                    style: new TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight:  FontWeight.w600,

                    )
                )
            ),

            //Overweight text
            new Padding(padding: EdgeInsets.all(7.5)),

            new Center(
                child: new Text("${_formattedText.text}",
                    style: new TextStyle(
                      color: Colors.pink,
                      fontSize: 17,
                      fontWeight:  FontWeight.w600,

                    )
                )
            )
          ],

        ),
      )
    );
  }



}