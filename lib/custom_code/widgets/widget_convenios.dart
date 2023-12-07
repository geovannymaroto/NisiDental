// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class WidgetConvenios extends StatefulWidget {
  const WidgetConvenios({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _WidgetConveniosState createState() => _WidgetConveniosState();
}

class _WidgetConveniosState extends State<WidgetConvenios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFcbf3f0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "*Aquí encontrarás información valiosa sobre los acuerdos que hemos establecido para ofrecerte beneficios exclusivos.")
          ]),
    );
  }
}
