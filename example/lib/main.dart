import 'package:flutter/material.dart';
import 'test_fancy_border_radius_widget.dart';
import 'test_animated_border_radius_widget.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "test_fancy_border_radius_widget": (_) => TestFancyBorderRadiusWidget(title: "TestFancyBorderRadiusWidget",),
        "test_animated_border_radius_widget": (_) => TestAnimatedBorderRadiusWidget(title: "TestAnimatedBorderRadiusWidget",),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _State createState() => _State();
}

class _State extends State<MyHomePage> {

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
            RaisedButton(
              child: Text("TestFancyBorderRadiusWidget"),
              onPressed: () {
                Navigator.of(context).pushNamed("test_fancy_border_radius_widget");
              },
            ),
            RaisedButton(
              child: Text("TestAnimatedBorderRadiusWidget"),
              onPressed: () {
                Navigator.of(context).pushNamed("test_animated_border_radius_widget");
              },
            ),
          ],
        ),
      ),
    );
  }
}

