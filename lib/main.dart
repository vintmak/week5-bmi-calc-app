import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  double _heightSliderValue = 150;
  double _weightSliderValue = 70;
  var message = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"), backgroundColor: Colors.red,),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Text("BMI Calculator", style:TextStyle(fontSize: 32, color:Colors.red)),
            SizedBox(height: 8,),
            Image.asset("assets/heart.jpg"),
            SizedBox(height: 8,),
            Text("We care about your health"),
            SizedBox(height: 8,),
            Text("Height: ${_heightSliderValue.round()} cm"),
            Slider (
              value: _heightSliderValue,
              min: 100,
              max: 220,
              divisions: 5,
              label: _heightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              }
              ),
            SizedBox(height: 8,),
            Text("Weight: ${_weightSliderValue.round()} kg"),
            Slider (
                value: _weightSliderValue,
                min: 60,
                max: 160,
                divisions: 5,
                label: _weightSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _weightSliderValue = value;
                  });
                }
            ),
            SizedBox(height: 8,),
            Text(message),
            FlatButton.icon(onPressed: (){
              var bmi = _weightSliderValue / pow((_heightSliderValue / 100), 2);
              var status = "";
              print(bmi.round());

              if (bmi < 18){
                status = "Underweight";
              }
              else if (bmi < 25) {
                status = "Normal";
              }
              else if (bmi < 30) {
                status = "Overweight";
              }
              else {
                status = "Obese";
              }
              setState(() {
                message = "Your BMI is ${bmi.round()} and you are $status. ";
              });
            }, icon: Icon(Icons.favorite), label: Text("Calculate BMI"), color:
            Colors.red, textColor: Colors.white,)
          ],
        ),
      )
    );
  }
}

