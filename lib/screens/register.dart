import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_future/model/user.dart';
import 'detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkValue1 = false;
  bool _checkValue2 = false;
  bool _checkValue3 = false;
  int _genderValue = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _favoriteController = TextEditingController();

  getUser(){
    var fullName = _nameController.text;
    var email = _emailController.text;

    var genderName = 'None';
    if(_genderValue ==  1){
      genderName = "Male";
    }
    else if (_genderValue == 2) {
      genderName = "Female";
    }
    else {
      genderName = "Other";
    }
    var favoriteName =  '';
    if (_checkValue1){
      favoriteName += "Music, ";
    }

    if (_checkValue2){
      favoriteName += "Movie, ";
    }

    if (_checkValue3){
      favoriteName += "Book, ";
    }
    favoriteName != "" ? favoriteName.substring(0, favoriteName.length - 2) : favoriteName;

    return User(name: fullName, email: email, gender: genderName, favorite: favoriteName);
  }

  Future<bool> saveUser(User objUser) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String strUser = jsonEncode(objUser);
      prefs.setString('user', strUser);
      return true;
    }
    catch (e){
      print(e);
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'User Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                icon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.password),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                icon: Icon(Icons.password),
              ),
            ),
            const SizedBox(height: 15),
            const Text("What is your Gender?"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0),
                    value: 0,
                    groupValue: _genderValue,
                    title: const Text("Male"),
                    onChanged: (value) {
                      setState(() {
                        _genderValue = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.all(0),
                    value: 1,
                    groupValue: _genderValue,
                    title: const Text("Female"),
                    onChanged: (value) {
                      setState(() {
                        _genderValue = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.all(0),
                    value: 2,
                    groupValue: _genderValue,
                    title: const Text("Other"),
                    onChanged: (value) {
                      setState(() {
                        _genderValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text("What is your favorite?"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: const Text('Music'),
                    value: _checkValue1,
                    onChanged: (value) {
                      setState(() {
                        _checkValue1 = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: const Text('Movie'),
                    value: _checkValue2,
                    onChanged: (value) {
                      setState(() {
                        _checkValue2 = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: const Text('Other'),
                    value: _checkValue3,
                    onChanged: (value) {
                      setState(() {
                        _checkValue3 = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      var gender = '';
                      if (_genderValue == 0) {
                        gender = 'Male';
                      } else if (_genderValue == 1) {
                        gender = 'Female';
                      } else {
                        gender = 'Other';
                      }

                      var favorite = '';
                      if (_checkValue1) {
                        favorite += 'Music, ';
                      }
                      if (_checkValue2) {
                        favorite += 'Movie, ';
                      }
                      if (_checkValue3) {
                        favorite += 'Other, ';
                      }

                      if (favorite.isNotEmpty) {
                        favorite = favorite.substring(0, favorite.length - 2);
                      }

                      User user = getUser();
                      if (await saveUser(user) == true){
                        print(user.toJson());
                        showDialog(context: context, builder: (BuildContext context){
                          return const AlertDialog(
                            title: Text("Alert"),
                            content: SingleChildScrollView(child: Text("Save Successfully"),),
                          );
                        });
                      };

                    },
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Divider(height: 5),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
