import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registro_widget.dart' show RegistroWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistroModel extends FlutterFlowModel<RegistroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtnombre widget.
  FocusNode? txtnombreFocusNode;
  TextEditingController? txtnombreController;
  String? Function(BuildContext, String?)? txtnombreControllerValidator;
  // State field(s) for txtemail widget.
  FocusNode? txtemailFocusNode;
  TextEditingController? txtemailController;
  String? Function(BuildContext, String?)? txtemailControllerValidator;
  // State field(s) for txtcontrasena widget.
  FocusNode? txtcontrasenaFocusNode;
  TextEditingController? txtcontrasenaController;
  String? Function(BuildContext, String?)? txtcontrasenaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    txtnombreFocusNode?.dispose();
    txtnombreController?.dispose();

    txtemailFocusNode?.dispose();
    txtemailController?.dispose();

    txtcontrasenaFocusNode?.dispose();
    txtcontrasenaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
