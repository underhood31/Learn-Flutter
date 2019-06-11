import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mysql1/mysql1.dart';


void main(){

  print('hello world');
  runApp(
      MaterialApp(
      title: 'Navigation Basics',
      home: myApp(),
    )
  );

}

class myApp extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() {
    return myAppState();
  }
}

class myAppState extends State<myApp>{
 
  var _id="";
  var data;
 
  Widget build(context){
    print('$data');
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: (){
            
            getData();
            
             Future.delayed(const Duration(milliseconds: 3000), () {
                setState(() {
                  // Here you can write your code for open new view
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DetailDisplay(data)),
                );
    
                  });
                });
          
        }),
        appBar: AppBar(
          title: Text("Sql integration"),
          centerTitle: true,
          
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                     hintText: "eg. B2201401"
                  ),
                  onChanged: (String str){
                    setState(() {
                     _id = str; 
                    });
                  },
                )
              ],
            ),
          ),
        ), 
        
        
      );
  }

  Future getData() async {
    var setting = new ConnectionSettings(
      host: '208.91.198.24',
      port: 3306,
      user: 'protsuls_abc',
      password: 'abc!@#\$%^&*()',
      db: 'protsuls_AppData'
    );
    var conn = await MySqlConnection.connect(setting);
    // var userId = 1;
    var query="SELECT Roll_no, name FROM ProtData where Roll_no=\"$_id\";";
   
      var results = await conn.query(query);
      
      for (var col in results) {
        
        print('Name: ${col[0]}, email: ${col[1]}');
      }
      
      await conn.close();
      data = results;
    

   
  }
}

class DetailDisplay extends StatelessWidget{
 
  var _data;
  var name;
  var id;
  DetailDisplay(var d){
    _data = d;
    for (var col in _data) {
      
      name= col[1];
      id= col[0];
    }
    
  }
  
  @override 
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail window"),
        
      ),
      body: Center(
        child: Text(
          'ID: $id \nName: $name',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}