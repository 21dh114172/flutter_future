import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_future/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget{
  const Detail({super.key});
  @override
  State<Detail> createState() => _Detail();
}
class _Detail extends State<Detail> {
  User user = User(name: "No data");
  
  getUser() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUser = prefs.getString("user") ?? "";

    if (strUser != "") {
      this.user = User.fromJson(jsonDecode(strUser));

    }
    else{
      this.user = User(name: "No data");       
    }

    setState(() {
      
    });
  }
  @override
  void initState(){
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    TextStyle myStyle = const TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: ${user.name}",
              style: myStyle,
            ),
            // Text(
            //   "Email: ${user.email}",
            //   style: myStyle,
            // ),
            Text(
              "Gender: ${user.gender}",
              style: myStyle,
            ),
            Text(
              "Favorite: ${user.favorite}",
              style: myStyle,
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back!')),
          ],
        ),
      ),
    );
  }
}
