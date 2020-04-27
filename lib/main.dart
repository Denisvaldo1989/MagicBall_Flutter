import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        title: Text('Pergunte-me qualquer coisa\ne clique na tela',
        textAlign: TextAlign.center),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  bool isPlay = false;

  void play() {
    setState(() {
      isPlay = false;
    });
    Future.delayed(
      Duration(seconds: 2),
    ).then((_) {
      setState(() {
        isPlay = true;
        ballNumber = Random().nextInt(5) + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: play,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Image.asset('images/bola$ballNumber.png'),
              !isPlay
                  ? Padding(
                    padding: const EdgeInsets.only(left: 7,top: 98),
                    child: Center(child: Image.asset('images/magicball.gif', scale: 1.3)),
                  )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
