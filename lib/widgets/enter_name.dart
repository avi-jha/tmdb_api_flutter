import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/widgets/home.dart';
import 'package:movie_app_flutter/utils/user_model.dart';

class EnterYourName extends StatefulWidget {
  const EnterYourName({Key key}) : super(key: key);

  @override
  State<EnterYourName> createState() => _EnterYourNameState();
}

Future<UsernameModel> createUser(String username, String key) async{
  // final String apiUrl = "http://localhost:9001";
  final String apiUrl = 'http://192.168.196.113:8000/';

  final response = await http.post(Uri.parse(apiUrl), body: {
    "username" : username,
    "key" : key,
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;

    return usernameModelFromJson(responseString);
  } else {
    print(response);
    return null;
  }

}

class _EnterYourNameState extends State<EnterYourName> {

  UsernameModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      floatingActionButton: FloatingActionButton(
        mini: false,
        backgroundColor: Colors.black,
        splashColor: Colors.black,
        hoverElevation: 1.5,
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.blue,
            width: 4,
          ),
        ),
        elevation: 1.5,


        onPressed: () async {
          final String username = nameController.text;
          final String key = keyController.text;
          final UsernameModel user = await createUser(username, key);
          print(user);

          setState(() {
            _user = user;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),),
          );
        },


        child: const FittedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Please enter your name:',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: TextField(
              controller: keyController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your key',
              ),
            ),
          ),
          SizedBox(height: 32,),

          _user == null ? Container() :
              Text('Welcome, ${_user.username}.'),
        ],
      ),
    );
  }
}
