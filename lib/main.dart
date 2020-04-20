import 'package:flutter/material.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items =new List<String>.generate(30,(i)=>"Items ${i+1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to dismiss"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder:(BuildContext context,int index){
          return Dismissible(
            key: Key(items[index]), 
        onDismissed: (direction){
          items.removeAt(index);
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Items dismissed"),));
        },
        background: Container(
          color: Colors.green,
        ),
        child:ListTile(
          title: Text("${items[index]}"),
        ),
          );
        },
        ),
    );
  }
}