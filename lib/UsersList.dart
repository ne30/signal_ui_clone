import "dart:math";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Models.dart';

class UserList extends StatelessWidget {
  // final String name;
  // final int c;
  //key: Key("val"), title: "title",
  // UserList({this.name="name", this.c=2});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignalList(),
    );
  }
}

class SignalList extends StatefulWidget {
  //SignalList({required Key key, required this.title}) : super(key: key);

  //final String title;

  @override
  _SignalListState createState() => _SignalListState();
}

class _SignalListState extends State<SignalList> {

  Future<List<User>> _getUsers() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    List<User> users = [];
    for(var i in jsonData) {
      User temp = User(i['id'], i['name']);
      users.add(temp);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    Color getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return Container(
      child: FutureBuilder(
        future: _getUsers(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(snap.data == null){
            return Container(
              child: Center(
                child: Text(
                  "Loading..."
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snap.data.length,
              itemBuilder: (BuildContext context, int index){
                return InkWell(
                  splashColor: getRandomColor(),
                  onTap: () {},
                  child: Ink(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: getRandomColor(),
                        child: Text(
                          snap.data[index].name.substring(0,2).toUpperCase(),
                        ),
                      ),
                      title: Text(
                        snap.data[index].name,
                      ),
                      subtitle: Text(
                        '${snap.data[index].name} is on signal.',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Aug 11"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      )
    );
  }
}

