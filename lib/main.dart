import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './UsersList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signal Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Signal",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xFF000000),
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                color: Color(0xFF000000),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  CupertinoIcons.ellipsis_vertical,
                  size: 25,
                ),
                color: Color(0xFF000000),
              ),
            ],
          ),
          body: UserList(

          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: (){},
                child: Icon(
                  Icons.photo,
                    color: Colors.black87,
                  ),
                  heroTag: null,
                  backgroundColor: Colors.white,
              ),
              SizedBox(
                height: 12,
              ),
              FloatingActionButton(
                  onPressed: (){},
                  child: Icon(Icons.edit),
                  heroTag: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

