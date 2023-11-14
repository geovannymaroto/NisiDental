import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'inicio_sesion_widget.dart' show InicioSesionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InicioSesionModel extends FlutterFlowModel<InicioSesionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtcorreo widget.
  FocusNode? txtcorreoFocusNode;
  TextEditingController? txtcorreoController;
  String? Function(BuildContext, String?)? txtcorreoControllerValidator;
  // State field(s) for txtcontrasea widget.
  FocusNode? txtcontraseaFocusNode;
  TextEditingController? txtcontraseaController;
  String? Function(BuildContext, String?)? txtcontraseaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    txtcorreoFocusNode?.dispose();
    txtcorreoController?.dispose();

    txtcontraseaFocusNode?.dispose();
    txtcontraseaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
