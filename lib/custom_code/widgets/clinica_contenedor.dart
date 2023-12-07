// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ClinicaContenedor extends StatefulWidget {
  const ClinicaContenedor({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ClinicaContenedorState createState() => _ClinicaContenedorState();
}

class _ClinicaContenedorState extends State<ClinicaContenedor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF2EC4B6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "*Los cupones pueden ser utilizados solo 1 vez por paciente y no se pueden usar mas de 1 cupon por tratamiento.")
          ]),
    );
  }
}
