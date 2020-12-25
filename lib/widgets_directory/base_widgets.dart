import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps/bean/directory.dart';

class BaseWidgets extends StatelessWidget {
  List<WidgetsDirectory> _list = List();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(




      home: Scaffold(
        appBar: AppBar(
          title: Text(""),

        ),

        body: SafeArea(
          child: ListView.builder(itemBuilder: (buildContext,index){
            return Card(
              // key: Key("${_list[index].hashCode}"),
              margin: EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "${_list[index].routeName}");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                    ),
                    Text(
                      "${_list[index].title}",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text("${_list[index].subtitle}",
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
                color: Colors.black54,
              ),
            );
          }),
        ),
      )
    );
  }
}


