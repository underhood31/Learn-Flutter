import 'package:flutter/material.dart';

class App extends StatefulWidget{
  createState(){
    return AppStateKeeper();
  }
}


class AppStateKeeper extends State<App> {
  final barColor = const Color(0xFF26ae60);
  final bgColor = const Color(0xFFDAE0E2);
  final iconColor = const Color(0xFF2B2B52);
  int count_val = 0;

  Widget build (context) {
    return MaterialApp(
      home: Scaffold(
        body: RichText(
          text: TextSpan(
            text: '$count_val',
            style: TextStyle(fontStyle: FontStyle.italic, color: iconColor, fontSize: 30.00) 
          ),
          
        ),
        drawer: Drawer(

        ),
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.mic_none,size: 30.0 ,color: iconColor),        
          backgroundColor: barColor,
          onPressed: (){
            setState(() {
              count_val += 1;
            });
          },
        ),
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
            style: TextStyle(fontStyle: FontStyle.normal),
            
          ),
          backgroundColor: barColor,
        ),
      ),
    );
  }
} 