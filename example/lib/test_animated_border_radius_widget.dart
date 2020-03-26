import 'package:flutter/material.dart';
import 'package:fancy_border_radius/fancy_border_radius.dart';

class TestAnimatedBorderRadiusWidget extends StatefulWidget {
  TestAnimatedBorderRadiusWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _State createState() => _State();
}

class _State extends State<TestAnimatedBorderRadiusWidget> {

  double topMin = 0.3, topMax = 0.7;
  double rightMin = 0.3, rightMax = 0.7;
  double bottomMin = 0.3, bottomMax = 0.7;
  double leftMin = 0.3, leftMax = 0.7;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(height: 100,),
            AnimatedBorderRadiusWidget(300, 300,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple,
                        Colors.red,
                      ],
                    )
                ),
              ),
              isPlaying: isPlaying,
              step: 0.0005,
            ),
            Container(height: 100,),
            Switch(
              value: isPlaying,
              onChanged: (value) {
                isPlaying = value;
                setState(() {

                });
              },
            )
          ],
        ),
      ),
    );
  }
}
