import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:movie_app_flutter/widgets/enter_name.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  static const style = TextStyle(
    fontSize: 20,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: Colors.pinkAccent,
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/page1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Column(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text("Movie.com", style: MyApp.style),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        " Let's Get Started!",
                        style: MyApp.style,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/page2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Column(
                children: const <Widget>[
                  Text(
                    "Enter",
                    style: MyApp.style,
                  ),
                  Text(
                    "Name!",
                    style: MyApp.style,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/page3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Column(
                children: const <Widget>[
                  Text(
                    "Select your",
                    style: MyApp.style,
                  ),
                  Text(
                    "Favourite Movie",
                    style: MyApp.style,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    Container(
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/page4.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Column(
                children: const <Widget>[
                  Text(
                    "Or",
                    style: MyApp.style,
                  ),
                  Text(
                    "Favourite Actor",
                    style: MyApp.style,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    Container(
      color: Colors.yellowAccent,
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/page5.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Column(
                children: const <Widget>[
                  Text(
                    "Voila!",
                    style: MyApp.style,
                  ),
                  Text(
                    "Thank You",
                    style: MyApp.style,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - (page - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  bool slideIcon = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.cyan),
      home: Builder(
        builder: (context) => Scaffold(
          body: Stack(
            children: [
              LiquidSwipe(
                enableSideReveal: slideIcon,
                pages: pages,
                onPageChangeCallback: pageChangeCallback,
                waveType: WaveType.liquidReveal,
                liquidController: liquidController,
                ignoreUserGestureWhileAnimating: true,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(pages.length, _buildDot),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
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
                          builder: (context) => EnterYourName(),),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      if (lpage == pages.length - 1) {
        slideIcon = false;
      } else {
        slideIcon = true;
      }
      page = lpage;
    });
  }
}
