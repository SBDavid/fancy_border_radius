import 'package:flutter/material.dart';
import 'package:fancy_border_radius/fancy_border_radius.dart';

class TestFancyBorderRadiusWidget extends StatefulWidget {
  TestFancyBorderRadiusWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _State createState() => _State();
}

class _State extends State<TestFancyBorderRadiusWidget> {

  double top = 0.5;
  double right = 0.5;
  double bottom = 0.5;
  double left = 0.5;

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
            FancyBorderRadiusWidget(300, 300, EdgeInsets.only(
                top: top,
                right: right,
                bottom: bottom,
                left: left
            ),
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
            ),
            Container(height: 100,),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Top: ${top.toStringAsFixed(2)}"),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Slider(
                    value: top,
                    onChanged: (value) {
                      setState(() {
                        top = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Right: ${right.toStringAsFixed(2)}"),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Slider(
                    value: right,
                    onChanged: (value) {
                      setState(() {
                        right = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Bottom: ${bottom.toStringAsFixed(2)}"),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Slider(
                    value: bottom,
                    onChanged: (value) {
                      setState(() {
                        bottom = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Left: ${left.toStringAsFixed(2)}"),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Slider(
                    value: left,
                    onChanged: (value) {
                      setState(() {
                        left = value;
                      });
                    },
                  ),
                )
              ],
            ),

            /*Container(
              width: 300,
              height: 400,
              decoration: ShapeDecoration(
                shape:
                UnderlineInputBorder()+
                StadiumBorder(
                  side: BorderSide(width: 8, color: Colors.red),
                )+
                BeveledRectangleBorder(
                  side: BorderSide(width: 8, color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.elliptical(80, 120)),
                )+
                ContinuousRectangleBorder(
                  side: BorderSide(width: 8, color: Colors.pink),
                  borderRadius: BorderRadius.all(Radius.elliptical(80, 120)),
                )+
                RoundedRectangleBorder(
                  side: BorderSide(width: 8, color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.elliptical(80, 120)),
                )+
                Border.all(
                    color: Colors.transparent,
                    width: 8
                )+
                Border.all(
                    color: Colors.red,
                    width: 8
                )+CircleBorder(
                  side: BorderSide(width: 8, color: Colors.blue)
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple.withAlpha(50),
                        Colors.red.withAlpha(50),
                      ],
                    )
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
