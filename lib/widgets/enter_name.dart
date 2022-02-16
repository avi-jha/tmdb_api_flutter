import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widgets/home.dart';

class EnterYourName extends StatefulWidget {
  const EnterYourName({Key key}) : super(key: key);

  @override
  State<EnterYourName> createState() => _EnterYourNameState();
}

class _EnterYourNameState extends State<EnterYourName> {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
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
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
