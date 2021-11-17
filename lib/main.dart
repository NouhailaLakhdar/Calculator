import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";
  pressed(String text) {
    if (text == "C") {
      output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (text == "+" || text == "-" || text == "x" || text == "/") {
      num1 = int.parse(output);

      operand = text;
      output = "0";
    } else if (text == ".") {
      if (output.contains(".")) {
        print(" its already a decimal");
        return;
      } else {
        output = output + text;
      }
    } else if (text == "=") {
      num2 = int.parse(output);
      if (operand == "+") {
        output = (num1 + num2).toString();
      }
      if (operand == "x") {
        output = (num1 * num2).toString();
      }
      if (operand == "-") {
        output = (num1 - num2).toString();
      }
      if (operand == "/") {
        output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      output = output + text;
    }
    print(output);
    setState(() {
      output = int.parse(output).toString();
    });
  }

  Widget buidlbutton(String txtbtn) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          txtbtn,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () => pressed(txtbtn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(children: <Widget>[
          new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: new Text(
                output,
                style: new TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          new Expanded(
            child: new Divider(),
          ),
          new Column(children: [
            new Row(children: [
              buidlbutton("7"),
              buidlbutton("8"),
              buidlbutton("9"),
              buidlbutton("/"),
            ]),
            new Row(children: [
              buidlbutton("4"),
              buidlbutton("5"),
              buidlbutton("6"),
              buidlbutton("x"),
            ]),
            new Row(children: [
              buidlbutton("1"),
              buidlbutton("2"),
              buidlbutton("3"),
              buidlbutton("-"),
            ]),
            new Row(children: [
              buidlbutton("."),
              buidlbutton("0"),
              buidlbutton("00"),
              buidlbutton("+"),
            ]),
            new Row(children: [
              buidlbutton("C"),
              buidlbutton("="),
            ]),
          ]),
        ])));
  }
}
