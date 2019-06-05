import 'package:flutter/material.dart';


class Application extends StatelessWidget {
  final barColor = const Color(0xFF26ae60);
  final bgColor = const Color(0xFFDAE0E2);
  final iconColor = const Color(0xFF2B2B52);
  
  Widget build (context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(

        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.pan_tool,size: 30.0 ,color: iconColor),        
          backgroundColor: barColor,
          onPressed: (){

          },
        ),
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text("Hello Flutter"),
          backgroundColor: barColor,
        ),
      ),
    );
  }
} 